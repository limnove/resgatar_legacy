# apps/controllers/span/subscribers_controller.rb

module Span
  class SubscribersController < Span::ApplicationController
    include Resource
    # GET span/subscribers/slug
    def index
      @subscribers = Subscriber.all
      respond_to do |format|
        format.csv { send_data @subscribers.to_csv, filename: "subscribers-#{Date.today}.csv" }
      end
    end
  end
end
