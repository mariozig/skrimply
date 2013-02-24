class User < ActiveRecord::Base
  has_many :definitions

  attr_accessible :email, :name
end