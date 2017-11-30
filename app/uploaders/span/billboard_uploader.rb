# apps/uploaders/span/billboard_uploader.rb

module Span
  class BillboardUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    # Directory where the files will be uploaded
    def store_dir
      "uploads/#{model.class.to_s.underscore}/"
    end

    # Name of the file
    def filename
      "#{model.slug}.#{file.extension}" if original_filename.present?
    end

    # Original File
    process :rgbify

    # Versions
    version :span do
      version :cards do
        version :medium do
          process :rgbify
          process resize_to_fit: [280, 280]
        end
      end
    end

    version :web do
      version :screens do
        version :tiny do
          process :rgbify
          process resize_to_fit: [300, 300]
        end
        version :small do
          process :rgbify
          process resize_to_fit: [480, 480]
        end
        version :medium do
          process :rgbify
          process resize_to_fit: [720, 720]
        end
        version :large do
          process :rgbify
          process resize_to_fit: [960, 960]
        end
      end
    end

    private

    # Set colorspace keeping consistency.
    def rgbify
      begin
        manipulate! do |img|
          img.colorspace "sRGB"
          img
        end
      end
    end
  end
end
