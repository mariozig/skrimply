class User < ActiveRecord::Base
  has_many :definitions
  has_many :submitted_tracks, :class_name => "Track"
  has_many :submitted_artists, :class_name => "Artist"
  has_many :submitted_releases, :class_name => "Release"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name

  def display_name
    "#{first_name.titleize} #{last_name.first.capitalize}."
  end
end