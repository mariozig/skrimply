class Genre < ActiveRecord::Base
  has_many :artistic_genres
  has_many :artists, :through => :artistic_genres
  has_many :genre_releases
  has_many :releases, :through => :genre_releases
  has_many :genre_tracks
  has_many :tracks, :through => :genre_tracks

  attr_accessible :name
end
