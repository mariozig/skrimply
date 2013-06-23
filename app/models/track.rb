# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  duration   :string(255)
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Track < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :definitions
  has_many :artists, :through => :artist_tracks
  has_many :artist_tracks

  ### ALTERNATE
  # has_many :owning_artists,
  #             -> { where(:artist_tracks => { :artistic_role_id => 1 }) },
  #             :through => :artist_tracks,
  #             :source => :artist
  ### ALTERNATE

  #### ORIGINALS
  # has_many :owning_artist_tracks, -> { where artistic_role_id: ArtisticRole.owner }, class_name: "ArtistTrack"
  # has_many :owning_artists, :through => :owning_artist_tracks, :source => :artist
  # has_many :featured_artist_tracks, -> { where artistic_role_id: ArtisticRole.featured }, class_name: "ArtistTrack"
  # has_many :featuring_artists, :through => :featured_artist_tracks, :source => :artist
  #### ORIGINALS

  has_many :genre_tracks
  has_many :genres, :through => :genre_tracks
  has_many :release_tracks, :inverse_of => :track
  has_many :releases, :through => :release_tracks
  has_one :youtube_video

  accepts_nested_attributes_for :release_tracks,
                                :reject_if => :all_blank

  accepts_nested_attributes_for :artist_tracks

  # attr_accessible :duration, :lyrics, :name, :genre_ids, :owning_artist_ids,
  #                 :featuring_artist_ids, :release_tracks_attributes

  validates :name, :presence => true
  validates :lyrics, :presence => true
  # validates :owning_artist_ids, :presence => { :message => "at least 1 must be selected" }

  # Since we typically only have 1 track owner, this is a convenience method
  # def owning_artist
  #   owning_artists.first
  # end

  def youtubeable_title
    "#{owning_artist.name} - #{name}"
  end

  # def owning_artists
  #   Artist.find_owners_for_track(self.id)
  # end

  # def featuring_artists
  #   Artist.find_featureds_for_track(self.id)
  # end

  ######
  # def owning_artists
  #   self.artists.merge(Artist.owners)
  # end
  # scope :owning_artists, -> { artists.merge(Artist.owners) }
end
