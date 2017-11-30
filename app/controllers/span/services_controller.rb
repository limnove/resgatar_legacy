# apps/controllers/span/services_controller.rb

module Span
  class ServicesController < Span::ApplicationController
    include Resources

    # GET span/services
    def index
      @services = ServiceDecorator.decorate_collection Service.published_all
    end

    # GET span/services/all
    def all
      @services = ServiceDecorator.decorate_collection Service.list_all
      render :index
    end

    # GET span/services/unpublished
    def unpublished
      @services = ServiceDecorator.decorate_collection Service.unpublished_all
      render :index
    end

    # GET span/services/slug
    def show
      redirect_to edit_service_path(@service)
    end

    # GET span/services/new
    def new
      @service = Service.new
    end

    # POST span/services
    def create
      @service = Service.new service_params
      @positions = Service.pluck(:position).compact
      @positions << 0
      @service.position = (@positions.min - 1)
      if @service.save
        flash[:success] = "Service was successfully created."
        redirect_to span.services_path
      else
        render :new
      end
    end

    # GET span/biography/slug/edit
    def preview
    end

    # GET span/services/slug/edit
    def edit
    end

    # PATCH/PUT span/services/slug
    def update
      if @service.update service_params
        flash[:success] = "Service was successfully updated."
        redirect_to span.edit_service_path(@service)
      else
        render :edit
      end
    end

    # GET span/services/slug/seo_settings
    def seo_settings
    end

    # PATCH/PUT span/services/slug
    def update_seo_settings
      if @service.update_attributes service_params
        flash[:success] = "SEO Settings were successfully updated."
        redirect_to span.seo_settings_service_path(@service)
      else
        render :edit
      end
    end

    # DELETE span/services/slug
    def destroy
      @service.destroy
      flash[:success] = "Service was successfully destroyed."
      redirect_to span.services_path
    end

    # SORTABLE span/services
    def sortable
      Service.sort_position params[:service]
      render nothing: true
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resources
      @service = Service.find_by_slug! params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(
        :title,
        :description,
        :body,
        :imagebox,
        :remove_imagebox,
        :highlight,
        :position,
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
