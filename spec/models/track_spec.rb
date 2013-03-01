# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  duration   :string(255)
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Track do
  pending "add some examples to (or delete) #{__FILE__}"
end
