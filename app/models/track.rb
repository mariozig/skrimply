class Track < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :definitions
  has_many :artist_tracks
  has_many :artists, :through => :artist_tracks
  has_many :owning_artist_tracks, :class_name => "ArtistTrack",
                                  :conditions => { :artistic_role_id => ArtisticRole.owner }
  has_many :owning_artists, :through => :owning_artist_tracks, :source => :artist
  has_many :featured_artist_tracks, :class_name => "ArtistTrack",
                                    :conditions => { :artistic_role_id => ArtisticRole.featured }
  has_many :featuring_artists, :through => :featured_artist_tracks, :source => :artist
  has_many :genre_tracks
  has_many :genres, :through => :genre_tracks
  has_many :release_tracks, :inverse_of => :track
  has_many :releases, :through => :release_tracks

  accepts_nested_attributes_for :release_tracks,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :duration, :lyrics, :name, :genre_ids, :owning_artist_ids,
                  :featuring_artist_ids, :release_tracks_attributes

  validates :submitting_user, :presence => true
  validates :owning_artist_ids, :presence => true

  # Since we typically only have 1 track owner, this is a convenience method
  def owning_artist
    owning_artists.first
  end
end