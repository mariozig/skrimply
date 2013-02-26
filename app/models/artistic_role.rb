class ArtisticRole < ActiveRecord::Base
  attr_accessible :description, :role

  # TODO: This is lame.  This is an attempt to prevent a hit on the DB.
  def self.owner
    1
  end

  def self.featured
    2
  end
end
