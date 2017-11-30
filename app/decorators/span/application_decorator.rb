# apps/decorators/span/application_decorator.rb

module Span
  class ApplicationDecorator < Draper::Decorator
    delegate_all

    def get_edit_btn
      h.content_tag :li, class: "miscList floatRight" do
        h.link_to "Edit", [:edit, object], class: "editBtn"
      end
    end

    def get_handle_btn
      h.content_tag :li, class: "miscList floatRight" do
        h.link_to "Drag Me", "#", class: "off handle handleBtn"
      end
    end

    def get_destroy_btn
      h.content_tag :li, class: "miscList floatLeft" do
        h.link_to "Destroy", object, method: :delete, data: { confirm: "Are you sure you?" }, class: "destroyBtn"
      end
    end

    def get_title
      if object.title.present?
        h.content_tag :h3 do
          object.title
        end
      end
    end

    def get_description
      if object.description.present?
        h.content_tag :p do
          object.description
        end
      end
    end

    def get_medium_card_imagebox
      if object.imagebox.present?
        h.image_tag(object.imagebox_url(:span, :cards, :medium), alt: "Billboard Image")
      else
        h.image_tag("span/defaults/medium_card_default.png", size: "280x158", alt: "Billboard Default Image")
      end
    end

    def get_path
      if object.path.present?
        h.link_to "Test Path", object.path, class: "defaultBtn", target: "blank"
      else
        h.content_tag :h6, class: "empty" do
          "Path Not Given"
        end
      end
    end

    def get_published_status
      if object.published?
        h.content_tag :li, class: "miscList floatLeft" do
          h.content_tag :h6, class: "published" do
            "Published"
          end
        end
      else
        h.content_tag :li, class: "miscList floatLeft" do
          h.content_tag :h6, class: "published" do
            "Unpublished"
          end
        end
      end
    end
  end
end
