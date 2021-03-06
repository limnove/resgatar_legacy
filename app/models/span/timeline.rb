# apps/models/span/timeline.rb

module Span
  class Timeline < ActiveRecord::Base
    include Lists
    include SetSlug
    include StringGenerator
    include SortablePosition
    include DefaultValidations

    # Uploaders
    mount_uploader :imagebox, ImageUploader
  end
end
