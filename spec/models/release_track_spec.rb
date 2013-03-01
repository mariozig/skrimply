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

require 'spec_helper'

describe ReleaseTrack do
  pending "add some examples to (or delete) #{__FILE__}"
end
