# apps/models/span/contact_setting.rb

module Span
  class ContactSetting < ActiveRecord::Base
    include SetSlug
    include StringGenerator
  end
end
