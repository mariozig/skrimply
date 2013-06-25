class Track < ActiveRecord::Base
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :definitions
  has_many :appearances, inverse_of: :track
  has_many :genre_tracks
  has_many :genres, :through => :genre_tracks
  has_many :release_tracks, :inverse_of => :track
  has_many :releases, :through => :release_tracks
  has_one :youtube_video

  accepts_nested_attributes_for :release_tracks,
                                :reject_if => :all_blank

  # accepts_nested_attributes_for :artist_tracks

  validates :name, :presence => true
  validates :lyrics, :presence => true

  def youtubeable_title
    "#{owning_artist.name} - #{name}"
  end
end
