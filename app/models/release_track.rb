class ReleaseTrack < ActiveRecord::Base
  belongs_to :release
  belongs_to :track, :inverse_of => :release_tracks

  default_scope order("position ASC")

  attr_accessible :disc_number, :position, :release_id, :track_id

  validates :release_id, :presence => true
end
