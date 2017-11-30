# apps/models/span/network.rb

module Span
  class Network < ActiveRecord::Base
    include Lists
    include SetSlug
    include StringGenerator
    include SortablePosition
    include DefaultValidations
  end
end
