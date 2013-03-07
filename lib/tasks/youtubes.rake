namespace :skrimply do
  namespace :youtube do
    desc "Populate all tracks with YouTube embed HTML. If embed HTML already exsits, it will be replaced."
    task :populate_embed_codes => :environment do
      Track.all.each do |track|
        # ENV vars come from Figaro
        # configs are in config/application.yml
        client ||= YouTubeIt::Client.new(:username => ENV["YOUTUBE_USERNAME"],
                                          :password => ENV["YOUTUBE_PASSWORD"],
                                          :dev_key => ENV["YOUTUBE_DEV_KEY"])

        videos = client.videos_by(query: track.youtubeable_title, format: 5, max_results: 1).videos

        unless videos.empty?
          track.build_youtube_video(embed_html: videos.first.embed_html)
          track.save!
        end
      end
    end
  end
end