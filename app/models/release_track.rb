class ReleaseTrack < ActiveRecord::Base
  belongs_to :release
  belongs_to :track

  attr_accessible :disc_number, :position, :release_id, :track_id
end
