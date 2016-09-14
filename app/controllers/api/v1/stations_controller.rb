module Api::V1
  class StationsController < ApiController
    # GET /stations
    def index
      client = Shoutcast::Api::Client.new(key: ENV['SHOUTCAST_API_KEY'])
      render json: client.top_500
    end
  end
end
