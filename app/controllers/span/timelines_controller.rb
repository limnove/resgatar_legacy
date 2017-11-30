# apps/controllers/span/timelines_controller.rb

module Span
  class TimelinesController < Span::ApplicationController
    include Resources

    # GET span/timelines
    def index
      @timelines = TimelineDecorator.decorate_collection Timeline.published_all
    end

    # GET span/timelines/all
    def all
      @timelines = TimelineDecorator.decorate_collection Timeline.list_all
      render :index
    end

    # GET span/timelines/unpublished
    def unpublished
      @timelines = TimelineDecorator.decorate_collection Timeline.unpublished_all
      render :index
    end

    # GET span/timelines/slug
    def show
      redirect_to edit_timeline_path(@timeline)
    end

    # GET span/timelines/new
    def new
      @timeline = Timeline.new
    end

    # POST span/timelines
    def create
      @timeline = Timeline.new timeline_params
      @positions = Timeline.pluck(:position).compact
      @positions << 0
      @timeline.position = (@positions.min - 1)
      if @timeline.save
        flash[:success] = "Timeline was successfully created."
        redirect_to span.timelines_path
      else
        render :new
      end
    end

    # GET span/biography/slug/edit
    def preview
    end

    # GET span/timelines/slug/edit
    def edit
    end

    # PATCH/PUT span/timelines/slug
    def update
      if @timeline.update timeline_params
        flash[:success] = "Timeline was successfully updated."
        redirect_to span.edit_timeline_path(@timeline)
      else
        render :edit
      end
    end

    # GET span/timelines/slug/seo_settings
    def seo_settings
    end

    # PATCH/PUT span/timelines/slug
    def update_seo_settings
      if @timeline.update_attributes timeline_params
        flash[:success] = "SEO Settings were successfully updated."
        redirect_to span.seo_settings_timeline_path(@timeline)
      else
        render :edit
      end
    end

    # DELETE span/timelines/slug
    def destroy
      @timeline.destroy
      flash[:success] = "Timeline was successfully destroyed."
      redirect_to span.timelines_path
    end

    # SORTABLE span/timelines
    def sortable
      Timeline.sort_position params[:timeline]
      render nothing: true
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resources
      @timeline = Timeline.find_by_slug! params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def timeline_params
      params.require(:timeline).permit(
        :title,
        :description,
        :body,
        :start,
        :end,
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
