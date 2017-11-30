# apps/models/span/biography.rb

module Span
  class Biography < ActiveRecord::Base
    include SetSlug
    include StringGenerator
    include DefaultValidations

    # Uploaders
    mount_uploader :imagebox, ImageUploader
  end
end
