# apps/models/span/billboard.rb

module Span
  class Billboard < ActiveRecord::Base
    include Lists
    include SetSlug
    include StringGenerator
    include SortablePosition

    # Uploaders
    mount_uploader :imagebox, BillboardUploader
  end
end
