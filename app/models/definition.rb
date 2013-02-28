class Definition < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  attr_accessible :text, :track_id, :user_id

  validates :track_id, :presence => true
  validates :user_id, :presence => true
end
