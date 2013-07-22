# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geo2tz/version'

Gem::Specification.new do |spec|
  spec.name          = "geo2tz"
  spec.version       = Geo2tz::VERSION
  spec.authors       = ["Christophe Verbinnen"]
  spec.email         = ["djpate@gmail.com"]
  spec.description   = "Get a ActiveSupport/Timezone from a given lat long"
  spec.summary       = "In order to do that It parses a list of all the cities from geonames.org and setup a Kdtree to find to closest city to your given coordinates and returns the associated timezone."
  spec.homepage      = "https://github.com/djpate/geo2tz"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "kdtree"
  spec.add_runtime_dependency "active_support", "=> 3.0"
  spec.add_runtime_dependency "zip"
end
