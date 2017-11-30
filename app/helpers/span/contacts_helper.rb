# apps/helpers/span/contacts_helper.rb

module Span
  module ContactsHelper
    # NOTE: Records are ordered ascendantly by position & date created

    def contacts
      @contacts ||= Span::Contact.published_all
    end
  end
end
