# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm2h/version'

Gem::Specification.new do |spec|
  spec.name          = "m2h"
  spec.version       = M2H::VERSION
  spec.authors       = ["arakanemacs"]
  spec.email         = ["arakanemacs@gmail.com"]
  spec.description   = %q{styled markdown parser}
  spec.summary       = %q{markdown to html}
  spec.homepage      = "https://github.com/arakanemacs/m2h"
  spec.license       = "MIT"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redcarpet", [">= 3.0.0"]

  spec.add_development_dependency "bundler", ["~> 1.3"]
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"

  spec.executables = 'm2h'
  spec.files = %w[
    Gemfile
    LICENSE
    README.md
    Rakefile
    bin/m2h
    lib/m2h.rb
    lib/m2h/_layout.erb
    lib/m2h/base.rb
    lib/m2h/optparser.rb
    lib/m2h/render.rb
    lib/m2h/version.rb
    m2h.gemspec
  ]
end
