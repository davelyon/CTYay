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
      @routes = parse Nokogiri::XML.parse(Request.new('/getroutes').get)
    end

    def description
      [short_name, common_name].join " "
    end

    private

    def self.parse(xml)
      xml.xpath("//route").map do |route|
        new( route.xpath("rt").inner_text, route.xpath("rtnm").inner_text)
      end
    end
  end
end
