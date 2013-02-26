class Artist < ActiveRecord::Base
  has_many :artist_tracks
  has_many :tracks, :through => :artist_tracks
  has_many :artist_releases
  has_many :releases, :through => :artist_releases
  has_many :artist_genres
  has_many :genres, :through => :artist_genres

  attr_accessible :name, :genre_ids

  def tracks_owned
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.owner.id} )
  end

  def tracks_featured_on
    tracks.where(:artist_tracks => { :artistic_role_id => ArtisticRole.featured.id } )
  end
end