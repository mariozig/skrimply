class Label < ActiveRecord::Base
  has_many :releases

  attr_accessible :name
end
