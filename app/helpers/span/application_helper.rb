# apps/helpers/span/application_helper.rb

module Span
  module ApplicationHelper

    private

    # Redirect to "offline" action if true
    def go_online
      @online ||= Span::Setting.where(published: true).first
      redirect_to root_path if @online
    end

    # Redirect to "offline" action if true
    def go_offline
      @offline ||= Span::Setting.where(published: false).first
      redirect_to offline_page_path if @offline
    end
  end
end
