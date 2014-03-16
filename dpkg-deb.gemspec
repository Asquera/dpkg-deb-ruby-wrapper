# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dpkg/deb/version'

Gem::Specification.new do |spec|
  spec.name          = "dpkg-deb"
  spec.version       = Dpkg::Deb::VERSION
  spec.authors       = ["Felix Gilcher"]
  spec.email         = ["felix.gilcher@asquera.de"]
  spec.summary       = %q{A ruby wrapper around dpgk-deb}
  spec.description   = %q{A ruby wrapper for dpbk-deb that allows reading of control information from .deb packages}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
