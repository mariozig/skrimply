class User < ActiveRecord::Base
  has_many :definitions

  attr_accessible :email, :first_name, :last_name
end