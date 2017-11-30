# apps/controllers/span/biographies_controller.rb

module Span
  class BiographiesController < Span::ApplicationController
    include Resource

    # GET span/biography/slug
    def show
      redirect_to span.edit_biography_path
    end

    # GET span/biography/slug/edit
    def preview
    end

    # GET span/biography/slug/edit
    def edit
    end

    # PATCH/PUT span/biography/slug
    def update
      if @biography.update biography_params
        flash[:success] = "Biography was successfully updated."
        redirect_to span.edit_biography_path
      else
        render :edit
      end
    end

    # GET span/biography/slug/edit
    def seo_settings
    end

    # PATCH/PUT span/timelines/slug
    def update_seo_settings
      if @biography.update_attributes biography_params
        flash[:success] = "SEO Settings were successfully updated."
        redirect_to span.seo_settings_biography_path(@biography)
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @biography = Biography.first!
    end

    # Only allow a trusted parameter "white list" through.
    def biography_params
      params.require(:biography).permit(
        :title,
        :description,
        :body,
        :imagebox,
        :remove_imagebox,
        :published,

        # SEO Settings
        :seo_title,
        :seo_description,
        :seo_tags,
        :seo_imagebox
      )
    end
  end
end
