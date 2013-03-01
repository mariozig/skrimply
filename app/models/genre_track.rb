# == Schema Information
#
# Table name: genre_tracks
#
#  id         :integer          not null, primary key
#  track_id   :integer
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GenreTrack < ActiveRecord::Base
  belongs_to :genre
  belongs_to :track

  attr_accessible :genre_id, :track_id
end
