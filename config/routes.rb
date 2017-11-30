# config/routes.rb

module Span
  Engine.routes.draw do
    # Added Actions
    def set_member_actions
      member do
        get :seo_settings
        get :seo_settings
        put :update_seo_settings
        patch :update_seo_settings
      end
    end

    def set_collection_actions
      collection do
        get :all
        get :unpublished
        post :sortable
      end
    end

    def set_preview
      member do
        get :preview
      end
    end

    # Static Pages
    root "pages#home"
    resource :pages, path: "/" do
      get :home
    end

    resource :administrator
    resource :session
    resources :reset_passwords
    get "login", to: "sessions#new", as: "login"
    get "logout", to: "sessions#destroy", as: "logout"

    resource :design do
      get :card
      get :list
      get :grid
      get :form
    end

    # Single resources
    resource :settings, only: [:show, :edit, :update, :seo_settings]
    resource :biography, only: [:show, :edit, :update, :seo_settings] do
      set_preview
      set_member_actions
    end

    # Multiple resources
    resources :timelines do
      set_preview
      set_member_actions
      set_collection_actions
    end
    resources :services do
      set_preview
      set_member_actions
      set_collection_actions
    end
    resources :contacts do
      set_member_actions
      set_collection_actions
    end
    resources :billboards do
      set_collection_actions
    end
    resources :networks do
      set_collection_actions
    end

    resource :timeline_settings
    resource :service_settings
    resource :contact_settings

    # CSV Exports
    resources :subscribers
  end
end
