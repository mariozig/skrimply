# == Schema Information
#
# Table name: artist_releases
#
#  id               :integer          not null, primary key
#  artist_id        :integer
#  release_id       :integer
#  artistic_role_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe ArtistRelease do
  pending "add some examples to (or delete) #{__FILE__}"
end
