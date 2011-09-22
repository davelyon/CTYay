require "ctyay/version"
require "rest-client"
require "nokogiri"

module Ctyay
  autoload(:Config, 'ctyay/config')
  autoload(:Route, 'ctyay/routes')
  autoload(:Request, 'ctyay/request')
  autoload(:Stop, 'ctyay/stop')
  autoload(:CTATime, 'ctyay/time')
end
