# config/initializers/carrierwave.rb

# Be sure to restart your server when you modify this file.

# NOTE: Environment Variables are setup in config/application.yml

# Amazon S3 stores data as objects within resources called "buckets."
# You can write, read, and delete objects in your bucket.
module Span
  CarrierWave.configure do |config|
    if Rails.env.test? || Rails.env.development?
      config.storage = :file
    else
      config.fog_credentials = {
        provider:              "AWS",
        aws_access_key_id:     ENV["STORAGE_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["STORAGE_SECRET_ACCESS_KEY"],
        region:                ENV["STORAGE_REGION"]
      }
      config.storage = :fog
      config.cache_dir = "#{Rails.root}/tmp/uploads"
      config.fog_directory    = ENV["STORAGE_BUCKET"]
      config.fog_attributes = { "Cache-Control" => "max-age=#{60.day.to_i}" }
      config.fog_public = true
    end
  end
end
