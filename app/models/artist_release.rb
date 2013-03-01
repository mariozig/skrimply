# == Schema Information
#
# Table name: artist_releases
#
#  id               :integer          not null, primary key
#  artist_id        :integer
#  release_id       :integer
#  artistic_role_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ArtistRelease < ActiveRecord::Base
  belongs_to :artist
  belongs_to :artistic_role
  belongs_to :release

  attr_accessible :artist_id, :artistic_role_id, :release_id

  validates :release_id, :uniqueness => {
                           :scope => [:artistic_role_id, :artist_id],
                           :message => "an artist cannot be featured on or own a release twice"
                         }
end
