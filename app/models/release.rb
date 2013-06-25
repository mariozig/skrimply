# == Schema Information
#
# Table name: releases
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  release_kind_id :integer
#  label_id        :integer
#  release_date    :string(255)
#  location        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class Release < ActiveRecord::Base
  belongs_to :label
  belongs_to :release_kind
  belongs_to :submitting_user, :class_name => "User", :foreign_key => "user_id"

  has_many :appearances, inverse_of: :release
  has_many :cuts, inverse_of: :release
  has_many :genre_releases
  has_many :genres, :through => :genre_releases

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :release_kind, :presence => true

  def label_name
    label.nil? ? "unknown" : label.name
  end

  def release_date_friendly
    release_date.nil? ? "unknown" : release_date
  end
end
