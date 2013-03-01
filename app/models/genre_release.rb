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

class GenreRelease < ActiveRecord::Base
  belongs_to :genre
  belongs_to :release

  attr_accessible :genre_id, :release_id
end
