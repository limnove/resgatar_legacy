# apps/controllers/span/timeline_settings_controller.rb

module Span
  class TimelineSettingsController < Span::ApplicationController
    include Resource

    # GET span/timeline_settings/slug
    def show
      redirect_to edit_timeline_settings_path
    end

    # GET span/timeline_settings/slug/edit
    def edit
    end

    # PATCH/PUT span/timeline_settings/slug
    def update
      if @timeline_settings.update timeline_settings_params
        flash[:success] = "Timeline Setting was successfully updated."
        redirect_to span.timeline_settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @timeline_settings = TimelineSetting.first!
    end

    # Only allow a trusted parameter "white list" through.
    def timeline_settings_params
      params.require(:timeline_setting).permit(
        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox
      )
    end
  end
end
