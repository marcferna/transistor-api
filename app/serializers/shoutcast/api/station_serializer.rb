module Shoutcast::Api
  class StationSerializer < ActiveModel::Serializer
    attributes :id, :name, :genre, :logo, :url

    def genre
      object.genres.first
    end

    def url
      "http://yp.shoutcast.com/sbin/tunein-station.pls?id=#{object.id}"
    end
  end
end
