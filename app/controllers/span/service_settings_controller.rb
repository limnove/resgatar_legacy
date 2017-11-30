# apps/controllers/span/service_settings_controller.rb

module Span
  class ServiceSettingsController < Span::ApplicationController
    include Resource

    # GET span/service_settings/slug
    def show
      redirect_to edit_service_settings_path
    end

    # GET span/service_settings/slug/edit
    def edit
    end

    # PATCH/PUT span/service_settings/slug
    def update
      if @service_settings.update service_settings_params
        flash[:success] = "Service Setting was successfully updated."
        redirect_to span.service_settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @service_settings = ServiceSetting.first!
    end

    # Only allow a trusted parameter "white list" through.
    def service_settings_params
      params.require(:service_setting).permit(
        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox
      )
    end
  end
end
