class Appearance < ActiveRecord::Base
  ROLES = %w[owner featured]

  belongs_to :artist, inverse_of: :appearances
  belongs_to :track, inverse_of: :appearances

  scope :as_owner, -> { where(role: 'owner') }
  scope :as_featured, -> { where(role: 'featured') }

  validates :role, inclusion: { in: ROLES }

  # Sweet metaprogramming technique from the Rails AntiPatterns book
  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  class << self
    ROLES.each do |role|
      define_method "#{role}" do
        role
      end
    end
  end

  # TODO: Add validations back
  # validates :track_id, :uniqueness => {
  #                        :scope => [:artistic_role_id, :artist_id],
  #                        :message => "an artist cannot be featured on or own a track twice"
  #                      }
end