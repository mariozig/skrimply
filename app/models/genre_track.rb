class GenreTrack < ActiveRecord::Base
  belongs_to :genre
  belongs_to :track

  attr_accessible :genre_id, :track_id

  validates :genre_id, :presence => true
  validates :track_id, :presence => true
end
