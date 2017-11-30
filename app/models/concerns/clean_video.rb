# app/model/concerns/clean_video.rb

module CleanVideo
  extend ActiveSupport::Concern
  # Split the ID
  def clean_video_regex
    videobox.to_s.gsub(/.*[\/]|.*[.*\=]/, "")
  end

  # Save only the ID
  def clean_video_id
    self.videobox = clean_video_regex
  end
end
