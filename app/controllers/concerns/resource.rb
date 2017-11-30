module Resource
  extend ActiveSupport::Concern
  included do
    before_action :set_resource, only: [:show, :edit, :update, :seo_settings, :update_seo_settings, :preview]
  end
end
