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

require 'spec_helper'

describe Definition do
  pending "add some examples to (or delete) #{__FILE__}"
end
