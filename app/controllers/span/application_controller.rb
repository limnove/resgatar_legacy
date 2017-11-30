# apps/controllers/span/application_controller.rb

module Span
  class ApplicationController < ActionController::Base
    # Specify so all gems that require
    # Span can reach the proper layout.
    layout "span/application"

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    # Lock "adminboard"
    before_action :authorize_administrator

    private

    # Setup the current_administrator method.
    def current_administrator
      @current_administrator ||= Administrator.find_by_authentication_token!(session[:authentication_token]) if session[:authentication_token]
    end

    # Verifies if the Administrator is Logged in or not.
    def authorize_administrator
      redirect_to span.login_path if current_administrator.nil?
    end

    # Creates the current_administrator.
    helper_method :current_administrator
  end
end
