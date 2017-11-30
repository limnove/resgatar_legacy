# apps/controllers/span/pages_controller.rb

module Span
  class PagesController < Span::ApplicationController
    # GET span/home
    def home
      @timelines = TimelineDecorator.decorate_collection Timeline.published_all.limit(4).reverse
    end
  end
end
