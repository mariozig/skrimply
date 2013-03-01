# == Schema Information
#
# Table name: releases
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  release_kind_id :integer
#  label_id        :integer
#  release_date    :string(255)
#  location        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'spec_helper'

describe Release do
  pending "add some examples to (or delete) #{__FILE__}"
end
