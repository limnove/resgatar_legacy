# apps/uploaders/span/sitemap_uploader.rb

module Span
  class SitemapUploader < ApplicationDocumentUploader
    # White list
    def extension_white_list
      %w(xml)
    end
  end
end
