module Api::V1
  class StationsController < ApiController
    skip_before_action :authenticate, only: [:index, :search]

    # GET /stations
    def index
      render json: client.top_500
    end

    # GET /stations/search
    def search
      render json: client.search(keyword: params['keyword'])
    end

    private

    def client
      @client ||= Shoutcast::Api::Client.new(key: ENV['SHOUTCAST_API_KEY'])
    end
  end
end
