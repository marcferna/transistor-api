module Shoutcast::Api
  class StationSerializer < ActiveModel::Serializer
    attributes :id, :name, :genres, :logo
  end
end
