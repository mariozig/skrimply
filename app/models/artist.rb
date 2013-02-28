class Artist < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :artist_tracks
  has_many :tracks, :through => :artist_tracks
  has_many :artist_releases
  has_many :releases, :through => :artist_releases
  has_many :artist_genres
  has_many :genres, :through => :artist_genres

  attr_accessible :name, :genre_ids

  validates :submitting_user, :presence => true
  validates :name, :presence => true

  def tracks_owned
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.owner } )
  end

  def tracks_featured_on
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.featured } )
  end
end