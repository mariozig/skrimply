# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  duration   :string(255)
#  lyrics     :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Track < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :definitions
  has_many :appearances, inverse_of: :track
  has_many :artists, through: :appearances
  has_many :genre_tracks
  has_many :genres, through: :genre_tracks
  has_many :cuts, inverse_of: :track
  has_many :releases, through: :cuts
  has_one :youtube_video

  # accepts_nested_attributes_for :release_tracks,
  #                               :reject_if => :all_blank

  # accepts_nested_attributes_for :artist_tracks

  validates :name, :presence => true
  validates :lyrics, :presence => true

  def owning_artists
    artists.merge(Appearance.as_owner)
  end

  def owning_artist
    owning_artists.first
  end

  def featuring_artists
    artists.merge(Appearance.as_featured)
  end

  def youtubeable_title
    "#{owning_artist.name} - #{name}"
  end

end
