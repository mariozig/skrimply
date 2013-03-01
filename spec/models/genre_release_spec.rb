# == Schema Information
#
# Table name: genre_releases
#
#  id         :integer          not null, primary key
#  release_id :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe GenreRelease do
  pending "add some examples to (or delete) #{__FILE__}"
end
