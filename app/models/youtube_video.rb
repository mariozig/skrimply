# == Schema Information
#
# Table name: youtube_videos
#
#  id         :integer          not null, primary key
#  embed_html :text
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class YoutubeVideo < ActiveRecord::Base
  belongs_to :track

  # attr_accessible :embed_html
end
