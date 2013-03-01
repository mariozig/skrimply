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

require 'spec_helper'

describe Definition do
  pending "add some examples to (or delete) #{__FILE__}"
end
