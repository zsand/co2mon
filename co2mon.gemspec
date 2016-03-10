# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'co2mon/version'

Gem::Specification.new do |spec|
  spec.name          = "co2mon"
  spec.version       = Co2mon::VERSION
  spec.authors       = ["Arkadiy Butermanov"]
  spec.email         = ["arkadiy.butermanov@flatstack.com"]

  spec.summary       = %q{FFI bindings for MasterKit CO2 Monitor}
  spec.homepage      = "https://github.com/arkadiybutermanov/co2mon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.extensions << './ext/co2mon/extconf.rb'
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
