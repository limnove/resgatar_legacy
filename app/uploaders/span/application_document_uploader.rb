# apps/uploaders/span/application_document_uploader.rb

module Span
  class ApplicationDocumentUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    # Directory where the files will be uploaded
    def store_dir
      "uploads/#{model.class.to_s.underscore}/"
    end

    # Name of the file
    def filename
      "#{model.slug}.#{file.extension}" if original_filename.present?
    end
  end
end
