# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  duration   :string(255)
#  lyrics     :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Track do 
  it { should belong_to(:submitting_user) }

  describe 'attributes' do
    let(:track) { Track.new }

    it 'has name' do
      track.name = 'name'
      expect(track.name).to eq('name')
    end    

    it 'has duration' do
      track.duration = '1:00'
      expect(track.duration).to eq('1:00')
    end

    it 'has lyrics' do
      track.lyrics = 'lyrics lyrics lyrics'
      expect(track.lyrics).to eq('lyrics lyrics lyrics')
    end 
  end

  describe 'callbacks' do
    it 'has the "set_appearing_artists" after_save callback' do
      Track._save_callbacks.select { |cb| cb.kind.eql?(:after) }.map(&:raw_filter).include?(:set_appearing_artists).should == true
    end

    describe '#set_appearing_artists' do
      it 'creates artist appearances' do
        artist1 = Artist.create(name: "artist1")
        artist2 = Artist.create(name: "artist2")

        t = stub_model(Track, name: "track", lyrics: "lyrics")
        t.set_owning_artists = [artist1]
        t.set_featuring_artists = [artist2]

        t.send(:set_appearing_artists)
        t.owning_artists.count.should == 1
        t.featuring_artists.count.should == 1
      end

      it 'prevents an artist from being owner and featured' do
        artist1 = Artist.create(name: "artist1")
        artist2 = Artist.create(name: "artist2")
        artist3 = Artist.create(name: "artist3")

        t = stub_model(Track, name: "track", lyrics: "lyrics")
        t.set_owning_artists = [artist1, artist2]
        t.set_featuring_artists = [artist2, artist3]

        t.send(:set_appearing_artists)
        
        t.owning_artists.should =~ [artist1, artist2]
        t.featuring_artists.should =~ [artist3]
      end
    end
  end
end