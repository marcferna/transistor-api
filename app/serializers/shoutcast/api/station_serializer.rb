module Shoutcast::Api
  class StationSerializer < ActiveModel::Serializer
    attributes :id, :name, :genre, :logo, :url, :discoverable, :spotlight,
      :banner

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

    def spotlight
      [
        '518832',
        '916267'
      ].include?(object.id)
    end

    def banner
      case object.id
      when '518832'
        'http://res.cloudinary.com/hyjp7k1ul/image/upload/v1487657315/'\
        'spotlight/maxima-fm_u2jnwf.jpg'
      when '916267'
        'http://res.cloudinary.com/hyjp7k1ul/image/upload/v1487659856/'\
        'spotlight/los-40_guc58l.jpg'
      end
    end
  end
end
