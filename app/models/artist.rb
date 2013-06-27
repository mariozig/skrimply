# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Artist < ActiveRecord::Base
  belongs_to :submitting_user, class_name: 'User', foreign_key: 'user_id'

  has_many :appearances, inverse_of: :artist
  has_many :releases, through: :appearances
  has_many :tracks, through: :appearances
  has_many :artist_genres
  has_many :genres, through: :artist_genres

  # attr_accessible :name, :genre_ids

  validates :name, :presence => true
  validates :name, :uniqueness => true

  def tracks_owned
    tracks.merge(Appearance.as_owner)
  end

  def tracks_featured_on
    tracks.merge(Appearance.as_featured)
  end
end
