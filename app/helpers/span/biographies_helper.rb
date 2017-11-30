# apps/helpers/span/biographies_helper.rb

module Span
  module BiographiesHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def biography
      @biography ||= Span::Biography.where(published: true).first
    end

    def biography_title
      @biography_title ||= biography.title
    end

    def biography_description
      @biography_description ||= biography.description
    end

    def biography_body
      @biography_body ||= biography.body
    end
  end
end
