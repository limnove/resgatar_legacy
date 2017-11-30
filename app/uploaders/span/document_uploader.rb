# apps/uploaders/span/document_uploader.rb

module Span
  class DocumentUploader < ApplicationDocumentUploader
    # White list
    def extension_white_list
      %w(pdf)
    end
  end
end
