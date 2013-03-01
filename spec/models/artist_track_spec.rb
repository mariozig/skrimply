# == Schema Information
#
# Table name: artist_tracks
#
#  id               :integer          not null, primary key
#  artist_id        :integer
#  track_id         :integer
#  artistic_role_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe ArtistTrack do
  pending "add some examples to (or delete) #{__FILE__}"
end
