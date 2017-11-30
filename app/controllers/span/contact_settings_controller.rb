# apps/controllers/span/contact_settings_controller.rb

module Span
  class ContactSettingsController < Span::ApplicationController
    include Resource

    # GET span/contact_settings/slug
    def show
      redirect_to edit_contact_settings_path
    end

    # GET span/contact_settings/slug/edit
    def edit
    end

    # PATCH/PUT span/contact_settings/slug
    def update
      if @contact_settings.update contact_settings_params
        flash[:success] = "Contact Setting was successfully updated."
        redirect_to span.contact_settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @contact_settings = ContactSetting.first!
    end

    # Only allow a trusted parameter "white list" through.
    def contact_settings_params
      params.require(:contact_setting).permit(
        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox
      )
    end
  end
end
