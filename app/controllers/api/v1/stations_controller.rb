module Api::V1
  class StationsController < ApiController
    skip_before_action :authenticate, only: [:index, :search]

    # GET /stations
    def index
      stations = Rails.cache.fetch 'stations/top500', expires_in: 1.day do
        client.top_500
      end
      render json: stations
    end

    # GET /stations/search
    def search
      keyword = params['keyword']
      stations = Rails.cache.fetch(
        "stations/search/#{keyword}",
        expires_in: 1.day
      ) do
        client.search(keyword: keyword)
      end
      render json: stations
    end

    private

    def client
      @client ||= Shoutcast::Api::Client.new(key: ENV['SHOUTCAST_API_KEY'])
    end
  end
end
