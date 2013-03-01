class ArtistGenre < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  attr_accessible :artist_id, :genre_id
end
