# apps/models/span/service_setting.rb

module Span
  class ServiceSetting < ActiveRecord::Base
    include SetSlug
    include StringGenerator
  end
end
