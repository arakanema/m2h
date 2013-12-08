# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'm2h/version'

Gem::Specification.new do |s|
  s.name          = "m2h"
  s.version       = "0.1.0"
  s.authors       = ["arakanemacs"]
  s.email         = ["arakanemacs@gmail.com"]
  s.description   = %q{styled markdown parser}
  s.summary       = %q{markdown to html}
  s.homepage      = "https://github.com/arakanemacs/m2h"
  s.license       = "MIT"

  s.add_runtime_dependency "redcarpet", [">= 3.0.0"]

  s.files = %w[
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
  s.executables = 'm2h'
  s.require_paths = ["lib"]
end
