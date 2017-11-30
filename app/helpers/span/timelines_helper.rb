# apps/helpers/span/timelines_helper.rb

module Span
  module TimelinesHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def timelines
      @timelines ||= Span::Timeline.published_all
    end

    def timeline_highlights
      @timeline_highlights ||= Span::Timeline.highlight_all
    end

    def timeline_off_highlights
      @timeline_off_highlights ||= Span::Timeline.off_highlight_all
    end

    def timeline
      @timeline = Timeline.find_by_slug! params[:id]
    end
  end
end
