# apps/helpers/span/billboards_helper.rb

module Span
  module BillboardsHelper
    # NOTE: Records are ordered ascendantly by position & date created

    # Get all published billboards
    def billboards
      @billboards ||= Span::Billboard.published_all
    end

    # Get the first billboard
    def billboard
      @billboard ||= Span::Billboard.first
    end
  end
end
