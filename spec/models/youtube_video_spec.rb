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

require 'spec_helper'

describe YoutubeVideo do
  pending "add some examples to (or delete) #{__FILE__}"
end
