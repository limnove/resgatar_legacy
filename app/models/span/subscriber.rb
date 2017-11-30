# app/models/span/subscriber.rb

module Span
  class Subscriber < ActiveRecord::Base
    include SetSlug
    include StringGenerator

    def self.to_csv
      attributes = %w{email}
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.each do |subscriber|
          csv << attributes.map{ |attr| subscriber.send(attr) }
        end
      end
    end
  end
end
