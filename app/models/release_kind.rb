# == Schema Information
#
# Table name: release_kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ReleaseKind < ActiveRecord::Base
  # attr_accessible :name

  validates :name, :presence => true
end
