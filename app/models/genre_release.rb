class GenreRelease < ActiveRecord::Base
  belongs_to :genre
  belongs_to :release

  attr_accessible :genre_id, :release_id
end
