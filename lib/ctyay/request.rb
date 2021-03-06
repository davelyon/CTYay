module Ctyay
  class Request
    BASE_URL = 'http://www.ctabustracker.com/bustime/api/v1'

    def initialize(action='', params='')
      @request = RestClient::Resource.new(BASE_URL + action + "?key=#{Ctyay::Config.bus_api_key}" + params)
    end

    def get
      @request.get
    end

    def url
      @request.url
    end

    def self.routes
      new("/getroutes").get
    end

    def self.directions(route)
      new("/getdirections", "&rt=#{route}").get
    end

    def self.stops(route_id, direction)
      new('/getstops', "&rt=#{route_id}&dir=#{URI.escape(direction)}").get
    end

    def self.time
      new('/gettime').get
    end
  end
end
