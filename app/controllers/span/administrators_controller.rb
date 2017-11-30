# app/controllers/span/administrators_controller.rb

module Span
  class AdministratorsController < Span::ApplicationController
    before_action :set_administrator, only: [:show, :edit, :update]

    # GET span/administrator/slug
    def show
      redirect_to span.edit_administrator_path
    end

    # GET span/administrator/slug/edit
    def edit
    end

    # PATCH/PUT span/administrator/slug
    def update
      if @administrator.update(administrator_params)
        flash[:success] = "Administrator was successfully updated."
        redirect_to edit_administrator_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = current_administrator
    end

    # Only allow a trusted parameter "white list" through.
    def administrator_params
      params.require(:administrator).permit(
        :name,
        :surname,
        :username,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
