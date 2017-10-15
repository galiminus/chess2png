# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chess2png/version"

Gem::Specification.new do |gem|
  gem.name          = "chess2png"
  gem.version       = Chess2PNG::VERSION
  gem.authors       = ["Victor Goya"]
  gem.email         = ["phorque@phorque.it"]
  gem.description   = "Turn chess boards into PNG images"
  gem.summary       = "Turn chess boards into PNG images"
  gem.homepage      = "https://phorque.it"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = %w(chess2png)
  gem.require_paths = ["lib"]
  gem.bindir        = 'bin'

  gem.licenses      = ["MIT"]

  gem.required_ruby_version = "~> 2.0"

  gem.add_dependency 'chess', '~> 0.2.0'
  gem.add_dependency 'chunky_png', '~> 1.3.8'

  gem.add_development_dependency "byebug"
end
