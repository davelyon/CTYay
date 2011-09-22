module Ctyay
  class Route
    attr_reader :short_name, :common_name

    def initialize(short_name, common_name)
      @short_name = short_name
      @common_name = common_name
    end

    def self.route(id)
      @routes ||= all
      @routes.select { |c| c.short_name == id }.first
    end

    def self.all
      @routes = parse Nokogiri::XML.parse(Request.routes)
    end

    def description
      [short_name, common_name].join " "
    end

    def directions
      Nokogiri::XML.parse(Request.new('/getdirections', "&rt=#{short_name}").get).xpath("//dir").map(&:inner_text)
    end

    def stops(direction)
      Stop.all(short_name, direction)
    end

    private

    def self.parse(xml)
      xml.xpath("//route").map do |route|
        new( route.xpath("rt").inner_text, route.xpath("rtnm").inner_text)
      end
    end
  end
end
