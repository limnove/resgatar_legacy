# apps/decorators/span/network_decorator.rb

module Span
  class NetworkDecorator < ApplicationDecorator
    def get_title
      if object.title == "facebook"
        h.content_tag :h3 do
          "Facebook"
        end
      elsif object.title == "twitter"
        h.content_tag :h3 do
          "Twitter"
        end
      elsif object.title == "instagram"
        h.content_tag :h3 do
          "Instagram"
        end
      elsif object.title == "linkedin"
        h.content_tag :h3 do
          "LinkedIn"
        end
      elsif object.title == "snapchat"
        h.content_tag :h3 do
          "Snapchat"
        end
      else
        h.content_tag :h3 do
          "No Social Network Selected"
        end
      end
    end
  end
end
