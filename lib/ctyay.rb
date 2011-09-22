require "ctyay/version"
require "rest-client"
require "nokogiri"

module Ctyay
  autoload(:CTATime, 'ctyay/time')
  autoload(:Config, 'ctyay/config')
  autoload(:Request, 'ctyay/request')
  autoload(:Route, 'ctyay/routes')
  autoload(:Stop, 'ctyay/stop')
end
