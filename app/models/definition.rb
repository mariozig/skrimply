# == Schema Information
#
# Table name: definitions
#
#  id                      :integer          not null, primary key
#  text                    :text
#  track_id                :integer
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  range_start             :integer
#  range_end               :integer
#  left_to_right_selection :boolean
#

class Definition < ActiveRecord::Base
  belongs_to :track
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  attr_accessible :text, :track_id, :range_start, :range_end, :left_to_right_selection

  validates :track_id, :presence => true
  validates :range_start, :presence => true
  validates :range_end, :presence => true
  validates :text, :presence => true
end
