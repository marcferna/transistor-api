module Api::V1
  class StationsController < ApiController
    skip_before_action :authenticate, only: [:index, :search]

    # GET /stations
    def index
      stations = Rails.cache.fetch 'stations/top500', expires_in: 1.day do
        client.top_500
      end
      stations += spotlight_stations
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

    def spotlight_stations
      stations_maximafm = Shoutcast::Api::Station.new
      stations_maximafm.id = '518832'
      stations_maximafm.name = 'Maxima FM'
      stations_maximafm.genres = ["House"]
      stations_maximafm.logo = 'http://i.radionomy.com/documents/radio/'\
        'fdc1ceaa-04a4-4604-be82-2606260b966d.s165.jpg'

      stations_los40 = Shoutcast::Api::Station.new
      stations_los40.id = '916267'
      stations_los40.name = 'Los 40 Principales'
      stations_los40.genres = ['Top 40']

      [
        stations_maximafm,
        stations_los40
      ]
    end
  end
end
