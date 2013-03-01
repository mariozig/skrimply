# == Schema Information
#
# Table name: release_tracks
#
#  id          :integer          not null, primary key
#  release_id  :integer
#  track_id    :integer
#  position    :integer
#  disc_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ReleaseTrack < ActiveRecord::Base
  belongs_to :release
  belongs_to :track, :inverse_of => :release_tracks

  default_scope order("position ASC")

  attr_accessible :disc_number, :position, :release_id, :track_id

  validates :position, :numericality => { :only_integer => true }
end
