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
  after_save :destroy_if_empty_release

  belongs_to :release
  belongs_to :track, :inverse_of => :release_tracks

  default_scope order("position ASC")

  attr_accessible :disc_number, :position, :release_id, :track_id

  validates :position, :numericality => { :only_integer => true }
  validates :track_id, :presence => true

  private
    def destroy_if_empty_release
      destroy if self.release_id.nil?
    end
end
