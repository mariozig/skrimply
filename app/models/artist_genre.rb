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

class ArtistGenre < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  attr_accessible :artist_id, :genre_id
end
