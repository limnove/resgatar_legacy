# apps/models/span/timeline_setting.rb

module Span
  class TimelineSetting < ActiveRecord::Base
    include SetSlug
    include StringGenerator
  end
end
