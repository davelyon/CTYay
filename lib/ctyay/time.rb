module Ctyay
  class CTATime
    def self.time
      Time.new( Nokogiri::XML.parse(Request.time).xpath("//tm").inner_text )
    end
  end
end
