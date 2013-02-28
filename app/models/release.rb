class Release < ActiveRecord::Base
  belongs_to :label
  belongs_to :release_kind

  has_many :genre_releases
  has_many :genres, :through => :genre_releases
  has_many :release_tracks
  has_many :tracks, :through => :release_tracks
  has_many :owning_artist_releases, :class_name => "ArtistRelease", :conditions => { :artistic_role_id => ArtisticRole.owner }
  has_many :owning_artists, :through => :owning_artist_releases, :source => :artist

  attr_accessible :label_id, :location, :name, :release_date, :release_kind_id, :owning_artist_ids

  # Since we typically only have 1 release owner, this is a convenience method
  def owning_artist
    owning_artists.first
  end

  def label_name
    label.nil? ? "unknown" : label.name
  end
end
