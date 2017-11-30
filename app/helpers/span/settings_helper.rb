# apps/helpers/span/settings_helper.rb

module Span
  module SettingsHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def settings
      @settings ||= Span::Setting.first
    end

    def app_title
      @app_title ||= settings.seo_title
    end

    def app_description
      @app_description ||= settings.seo_description
    end

    def app_tags
      @app_tags ||= settings.seo_tags
    end

    def app_document_url
      @app_document ||= settings.documentbox_url
    end

    def app_offline_title
      @app_offline_title ||= settings.offline_title
    end

    def app_offline_description
      @app_offline_description ||= settings.offline_description
    end

    def online
      @online ||= settings.published == true
    end

    def offline
      @offline ||= settings.published == false
    end
  end
end
