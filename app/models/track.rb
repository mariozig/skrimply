class Track < ActiveRecord::Base
  has_many :definitions
  has_many :artist_tracks
  has_many :artists, :through => :artists_tracks
  has_many :genre_tracks
  has_many :genres, :through => :genre_tracks
  has_many :release_tracks
  has_many :releases, :through => :releases_tracks

  attr_accessible :duration, :lyrics, :name
end