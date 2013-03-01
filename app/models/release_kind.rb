# == Schema Information
#
# Table name: release_kinds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReleaseKind < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
end
