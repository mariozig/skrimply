class Artist < ActiveRecord::Base
  has_many :artist_tracks
  has_many :tracks, :through => :artist_tracks
  has_many :artist_releases
  has_many :releases, :through => :artist_releases
  has_many :artist_genres
  has_many :genres, :through => :artist_genres


  attr_accessible :name
end