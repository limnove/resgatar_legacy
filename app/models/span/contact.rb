# apps/models/span/contact.rb

module Span
  class Contact < ActiveRecord::Base
    include Lists
    include SetSlug
    include StringGenerator
    include SortablePosition
    include DefaultValidations

    # Uploaders
    mount_uploader :imagebox, ImageUploader
  end
end
