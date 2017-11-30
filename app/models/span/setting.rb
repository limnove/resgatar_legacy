# apps/models/span/setting.rb

module Span
  class Setting < ActiveRecord::Base
    include SetSlug
    include StringGenerator

    # Uploaders
    mount_uploader :seo_imagebox, ImageUploader
    mount_uploader :sitemapbox, SitemapUploader
    mount_uploader :documentbox, DocumentUploader

    # Validations
    validates :seo_title, presence: true
    validates :seo_description, presence: true
    validates :seo_tags, presence: true
  end
end
