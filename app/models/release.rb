# == Schema Information
#
# Table name: releases
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  release_kind_id :integer
#  label_id        :integer
#  release_date    :string(255)
#  location        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Release < ActiveRecord::Base
  belongs_to :label
  belongs_to :release_kind
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :genre_releases
  has_many :genres, :through => :genre_releases
  has_many :release_tracks
  has_many :tracks, :through => :release_tracks
  has_many :owning_artist_releases, -> { where artistic_role_id: ArtisticRole.owner }, class_name: "ArtistRelease"
  has_many :owning_artists, :through => :owning_artist_releases, :source => :artist

  # attr_accessible :label_id, :location, :name, :release_date, :release_kind_id, :owning_artist_ids

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :release_kind, :presence => true
  validates :owning_artist_ids, :presence => true


  # Since we typically only have 1 release owner, this is a convenience method
  def owning_artist
    owning_artists.first
  end

  def label_name
    label.nil? ? "unknown" : label.name
  end

  def release_date_friendly
    release_date.nil? ? "unknown" : release_date
  end
end
