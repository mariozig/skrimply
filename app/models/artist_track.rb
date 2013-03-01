# == Schema Information
#
# Table name: artist_tracks
#
#  id               :integer          not null, primary key
#  artist_id        :integer
#  track_id         :integer
#  artistic_role_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ArtistTrack < ActiveRecord::Base
  belongs_to :artist
  belongs_to :track
  belongs_to :artistic_role

  attr_accessible :artist_id, :artistic_role_id, :track_id
end
