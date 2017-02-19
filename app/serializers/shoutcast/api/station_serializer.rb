module Shoutcast::Api
  class StationSerializer < ActiveModel::Serializer
    attributes :id, :name, :genre, :logo, :url, :discoverable

    def genre
      object.genres.first
    end

    def url
      "http://yp.shoutcast.com/sbin/tunein-station.pls?id=#{object.id}"
    end

    def discoverable
      [
        'Smooth Jazz',
        'Pop',
        'Top 40',
        'Easy Listening',
        'Dance'
      ].include?(genre)
    end
  end
end
