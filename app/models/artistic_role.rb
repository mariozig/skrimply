# == Schema Information
#
# Table name: artistic_roles
#
#  id          :integer          not null, primary key
#  role        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
