# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idn_sdk_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "idn_sdk_ruby"
  spec.version       = IdnSdkRuby::VERSION
  spec.authors       = ["sekhar"]
  spec.email         = ["sekhar@nbostech.com"]

  spec.summary       = %q{Ruby Wrapper to Connect Wavelabs IDN API Server.}
  spec.description   = %q{This gem is to communicate with registered modules API in IDN server.}
  spec.homepage      = "http://wavelabs.in"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib,spec}/**/*") + %w(LICENSE.txt README.md) + `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httmultiparty', "0.3.16"
  spec.add_dependency 'activemodel', "4.2.4"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
