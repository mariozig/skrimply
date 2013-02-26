class Track < ActiveRecord::Base
  has_many :definitions
  has_many :artist_tracks
  has_many :artists, :through => :artist_tracks
  has_many :owning_artists, :through => :artist_tracks, :source => :artist,
           :conditions => { :artist_tracks => { :artistic_role_id => ArtisticRole.owner.id } }
  has_many :featuring_artists, :through => :artist_tracks, :source => :artist,
           :conditions => { :artist_tracks => { :artistic_role_id => ArtisticRole.featured.id } }

  has_many :genre_tracks
  has_many :genres, :through => :genre_tracks
  has_many :release_tracks
  has_many :releases, :through => :release_tracks

  attr_accessible :duration, :lyrics, :name, :genre_ids, :artist_ids

  # Since we typically only have 1 track owner, this is a convenience method
  def owning_artist
    owning_artists.first
  end
end