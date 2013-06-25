# == Schema Information
#
# Table name: cuts
#
#  id          :integer          not null, primary key
#  release_id  :integer
#  track_id    :integer
#  position    :integer
#  disc_number :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Cut < ActiveRecord::Base
  belongs_to :release, inverse_of: :cuts
  belongs_to :track, inverse_of: :cuts

  default_scope { order("position ASC") }

  validates :position, numericality: { :only_integer => true }
  validates :release, presence: true
  validates :track, presence: true
end
