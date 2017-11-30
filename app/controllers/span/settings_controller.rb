# apps/controllers/span/settings_controller.rb

module Span
  class SettingsController < Span::ApplicationController
    include Resource

    # GET span/settings/slug
    def show
      render :edit
    end

    # GET span/settings/slug/edit
    def edit
    end

    # PATCH/PUT span/settings/slug
    def update
      if @setting.update setting_params
        flash[:success] = "Settings was successfully updated."
        redirect_to span.settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @setting = Setting.first!
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(
        :documentbox,
        :remove_documentbox,
        :published,

        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox,
        :remove_seo_imagebox,
        :offline_title,
        :offline_description
      )
    end
  end
end
