# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm2h/version'

Gem::Specification.new do |spec|
  spec.name          = "m2h"
  spec.version       = M2h::VERSION
  spec.authors       = ["arakanemacs"]
  spec.email         = ["arakanemacs@gmail.com"]
  spec.description   = %q{styled markdown parser}
  spec.summary       = %q{styled markdown parser}
  spec.homepage      = "https://github.com/arakanemacs/m2h"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.gem.add_runtime_dependency "redcarpet", [">= 3.0.0"]

  spec.add_development_dependency "bundler", ["~> 1.3"]
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end
