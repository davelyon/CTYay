# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ctyay/version"

Gem::Specification.new do |s|
  s.name        = "ctyay"
  s.version     = Ctyay::VERSION
  s.authors     = ["Dave Lyon"]
  s.email       = ["dave@davelyon.net"]
  s.homepage    = "http://github.com/davelyon/ctyay"
  s.summary     = %q{API Wrapper for CTA Train/Bus Tracking}
  s.description = %q{}

  s.rubyforge_project = "ctyay"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "2.6.0"
  s.add_development_dependency "fakeweb", "1.3.0"
  s.add_runtime_dependency "rest-client", "1.6.7"
  s.add_runtime_dependency "nokogiri", "1.5.0"
end
