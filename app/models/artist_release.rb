class ArtistRelease < ActiveRecord::Base
  belongs_to :artist
  belongs_to :artistic_role
  belongs_to :release

  attr_accessible :artist_id, :artistic_role_id, :release_id

  validates :artist_id, :presence => true
  validates :artistic_role_id, :presence => true
  validates :release_id, :presence => true
end
