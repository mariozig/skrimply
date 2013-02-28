class ArtistTrack < ActiveRecord::Base
  belongs_to :artist
  belongs_to :track
  belongs_to :artistic_role

  attr_accessible :artist_id, :artistic_role_id, :track_id

  validates :artist_id, :presence => true
  validates :artistic_role_id, :presence => true
  validates :track_id, :presence => true
end