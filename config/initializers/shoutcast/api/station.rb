require 'shoutcast/api'
module Shoutcast
  module Api
    class Station
      alias read_attribute_for_serialization send
    end
  end
end
