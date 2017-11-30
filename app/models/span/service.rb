# apps/models/span/service.rb

module Span
  class Service < ActiveRecord::Base
    include Lists
    include SetSlug
    include StringGenerator
    include SortablePosition
    include DefaultValidations

    # Uploaders
    mount_uploader :imagebox, ImageUploader
  end
end
