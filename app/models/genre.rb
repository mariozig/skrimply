# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ActiveRecord::Base
  has_many :artist_genres
  has_many :artists, :through => :artist_genres
  has_many :genre_releases
  has_many :releases, :through => :genre_releases
  has_many :genre_tracks
  has_many :tracks, :through => :genre_tracks

  attr_accessible :name
end
