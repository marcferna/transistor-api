module Shoutcast::Api
  class StationSerializer < ActiveModel::Serializer
    attributes :id, :name, :genres, :logo, :url

    def url
      "http://yp.shoutcast.com/sbin/tunein-station.pls?id=#{object.id}"
    end
  end
end
