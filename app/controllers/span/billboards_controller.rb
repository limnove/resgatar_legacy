# apps/controllers/span/billboards_controller.rb

module Span
  class BillboardsController < Span::ApplicationController
    include Resources

    # GET span/billboards
    def index
      @billboards = BillboardDecorator.decorate_collection Billboard.published_all
    end

    # GET span/billboards/all
    def all
      @billboards = BillboardDecorator.decorate_collection Billboard.list_all
      render :index
    end

    # GET span/billboards/unpublished
    def unpublished
      @billboards = BillboardDecorator.decorate_collection Billboard.unpublished_all
      render :index
    end

    # GET span/billboards/slug
    def show
      redirect_to span.edit_billboard_path(@billboard)
    end

    # GET span/billboards/new
    def new
      @billboard = Billboard.new
    end

    # GET span/billboards/slug/edit
    def edit
    end

    # POST span/billboards
    def create
      @billboard = Billboard.new billboard_params
      @positions = Billboard.pluck(:position).compact
      @positions << 0
      @billboard.position = (@positions.min - 1)
      if @billboard.save
        flash[:success] = "Billboard was successfully created."
        redirect_to span.billboards_path
      else
        render :new
      end
    end

    # PATCH/PUT span/billboards/slug
    def update
      if @billboard.update billboard_params
        flash[:success] = "Billboard was successfully updated."
        redirect_to span.edit_billboard_path(@billboard)
      else
        render :edit
      end
    end

    # DELETE span/billboards/slug
    def destroy
      @billboard.destroy
      flash[:success] = "Billboard was successfully destroyed."
      redirect_to span.billboards_path
    end

    # SORTABLE span/billboards
    def sortable
      Billboard.sort_position params[:billboard]
      render nothing: true
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resources
      @billboard = Billboard.find_by_slug! params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def billboard_params
      params.require(:billboard).permit(
        :title,
        :description,
        :path,
        :namepath,
        :imagebox,
        :remove_imagebox,
        :position,
        :published
      )
    end
  end
end
