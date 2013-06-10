# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Artist < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :artist_tracks
  has_many :tracks, :through => :artist_tracks
  has_many :artist_releases
  has_many :releases, :through => :artist_releases
  has_many :artist_genres
  has_many :genres, :through => :artist_genres

  # attr_accessible :name, :genre_ids

  validates :name, :presence => true
  validates :name, :uniqueness => true

  def tracks_owned
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.owner } )
  end

  def tracks_featured_on
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.featured } )
  end
end
