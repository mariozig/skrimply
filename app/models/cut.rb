class Cut < ActiveRecord::Base
  belongs_to :release, inverse_of: :cuts
  belongs_to :track, inverse_of: :cuts

  default_scope { order("position ASC") }

  validates :position, numericality: { :only_integer => true }
  validates :release, presence: true
  validates :track, presence: true
end
