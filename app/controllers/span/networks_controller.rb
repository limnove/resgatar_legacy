# apps/controllers/span/networks_controller.rb

module Span
  class NetworksController < Span::ApplicationController
    include Resources

    # GET span/networks
    def index
      @networks = NetworkDecorator.decorate_collection Network.published_all
      render :index
    end

    # GET span/networks/all
    def all
      @networks = NetworkDecorator.decorate_collection Network.list_all
      render :index
    end

    # GET span/networks/unpublished
    def unpublished
      @networks = NetworkDecorator.decorate_collection Network.unpublished_all
      render :index
    end

    # GET span/networks/new
    def new
      @network = Network.new
    end

    # GET span/networks/slug/edit
    def edit
    end

    # POST span/networks
    def create
      @network = Network.new network_params
      @positions = Network.pluck(:position).compact
      @positions << 0
      @network.position = (@positions.min - 1)
      if @network.save
        flash[:success] = "Network was successfully destroyed."
        redirect_to span.networks_path
      else
        render :new
      end
    end

    # PATCH/PUT span/networks/slug
    def update
      if @network.update network_params
        flash[:success] = "Network was successfully updated."
        redirect_to span.networks_path
      else
        render :edit
      end
    end

    # DELETE span/networks/slug
    def destroy
      @network.destroy
      flash[:success] = "Network was successfully destroyed."
      redirect_to span.networks_path
    end

    # SORTABLE span/networks
    def sortable
      Network.sort_position params[:network]
      render nothing: true
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resources
      @network = Network.find_by_slug! params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def network_params
      params.require(:network).permit(
        :title,
        :path,
        :imagebox,
        :position,
        :published
      )
    end
  end
end
