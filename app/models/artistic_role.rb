class ArtisticRole < ActiveRecord::Base
  attr_accessible :description, :role

  # TODO: This is lame.
  def self.owner
    find(1)
  end

  def self.featured
    find(2)
  end
end
