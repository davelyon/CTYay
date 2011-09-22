module Ctyay
  class Stop
    attr_reader :id, :name, :latitude, :longitude

    def self.all(route_id, direction)
      parse Nokogiri::XML.parse Request.stops(route_id, direction)
    end

    def initialize(id, name, latitude, longitude)
      @id, @name, @latitude, @longitude = id, name, latitude, longitude
    end

    def location
      [latitude, longitude]
    end

    private
    def self.parse(xml)
      xml.xpath("//stop").map do |stop|
        new( stop.xpath("stpid").inner_text, stop.xpath("stpnm").inner_text,
            stop.xpath("lat").inner_text, stop.xpath("lon").inner_text )
      end
    end
  end
end
