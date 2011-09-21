module Ctyay
  class Config
    def self.bus_api_key= key
      @@bus_api_key = key
    end

    def self.bus_api_key
      @@bus_api_key
    end
  end
end
