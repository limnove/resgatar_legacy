# apps/helpers/span/networks_helper.rb

module Span
  module NetworksHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def networks
      @networks ||= Span::Network.published_all
    end
  end
end
