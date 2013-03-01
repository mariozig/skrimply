class GenreTrack < ActiveRecord::Base
  belongs_to :genre
  belongs_to :track

  attr_accessible :genre_id, :track_id
end
