# == Schema Information
#
# Table name: definitions
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  track_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Definition < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  attr_accessible :text, :track_id, :user_id
end
