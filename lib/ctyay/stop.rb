module Ctyay
  class Stop
    attr_reader :id, :name, :latitude, :longitude

    def initialize(id, name, latitude, longitude)
      @id, @name, @latitude, @longitude = id, name, latitude, longitude
    end

    def location
      [latitude, longitude]
    end
  end
end
