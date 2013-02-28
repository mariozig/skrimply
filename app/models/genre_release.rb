class GenreRelease < ActiveRecord::Base
  belongs_to :genre
  belongs_to :release

  attr_accessible :genre_id, :release_id

  validates :genre_id, :presence => true
  validates :release_id, :presence => true
end
