# app/controllers/span/sessions_controller.rb

module Span
  class SessionsController < Span::ApplicationController
    skip_before_action :authorize_administrator

    def new
      if current_administrator.present?
        flash[:warning] = "You have already logged in."
        redirect_to span.root_path
      end
    end

    def create
      administrator = Administrator.find_by_email(params[:email])
      if administrator && administrator.authenticate(params[:password])
        session[:authentication_token] = administrator.authentication_token
        flash[:success] = "Hello! Welcome back."
        redirect_to span.root_path
      else
        flash[:failure] = "Oops. Something went wrong."
        redirect_to span.login_path
      end
    end

    def destroy
      session[:authentication_token] = nil
      if session.destroy
        flash[:success] = "Bye! Hope to see you soon."
        redirect_to span.root_path
      end
    end
  end
end
