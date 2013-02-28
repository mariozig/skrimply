class ArtistGenre < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  attr_accessible :artist_id, :genre_id

  validates :artist_id, :presence => true
  validates :genre_id, :presence => true
end
