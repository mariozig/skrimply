class ReleaseTrack < ActiveRecord::Base
  attr_accessible :disc_number, :position, :release_id, :track_id
end
