# apps/helpers/span/services_helper.rb

module Span
  module ServicesHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def services
      @services ||= Span::Service.published_all
    end

    def service_highlights
      @service_highlights ||= Span::Service.highlight_all
    end

    def service_off_highlights
      @service_off_highlights ||= Span::Service.off_highlight_all
    end

    def service
      @service = Service.find_by_slug! params[:id]
    end
  end
end
