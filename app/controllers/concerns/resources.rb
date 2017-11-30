module Resources
  extend ActiveSupport::Concern
  included do
    before_action :set_resources, only: [:show, :edit, :update, :destroy, :seo_settings, :update_seo_settings, :preview]
  end
end
