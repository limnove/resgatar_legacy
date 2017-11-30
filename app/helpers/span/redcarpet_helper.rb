# apps/helpers/span/redcarpet_helper.rb

module Span
  module RedcarpetHelper
    # Basic setup for the editor.
    def markdown(text)
      options = {
        tables: true,
        autolink: true,
        highlight: true,
        no_styles: true,
        hard_wrap: true,
        underline: true,
        filter_html: true,
        superscript: true,
        strikethrough: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        space_after_headers: true,
        link_attributes: { target: "_blank" }
      }

      extensions = {
        autolink: true,
        superscript: true,
        disable_indented_code_blocks: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end
  end
end
