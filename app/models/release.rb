class Release < ActiveRecord::Base
  belongs_to :label
  belongs_to :release_kind

  has_many :genre_releases
  has_many :genres, :through => :genre_releases
  has_many :artist_releases
  has_many :artists, :through => :artist_releases
  has_many :release_tracks
  has_many :tracks, :through => :release_tracks

  attr_accessible :label_id, :location, :name, :release_date, :release_kind_id
end
