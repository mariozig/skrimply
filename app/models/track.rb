class Track < ActiveRecord::Base
  has_many :definitions
  has_many :artists_tracks
  has_many :artists, :through => :artists_tracks
  has_many :genres_tracks
  has_many :genres, :through => :genres_tracks
  has_many :releases_tracks
  has_many :releases, :through => :releases_tracks

  attr_accessible :duration, :lyrics, :name
end
