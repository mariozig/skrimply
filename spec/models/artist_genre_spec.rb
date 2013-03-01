# == Schema Information
#
# Table name: artist_genres
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe ArtistGenre do
  pending "add some examples to (or delete) #{__FILE__}"
end
