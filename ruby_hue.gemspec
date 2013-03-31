# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_hue/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby_hue"
  gem.version       = RubyHue::VERSION
  gem.authors       = ["Robert Ross"]
  gem.email         = ["robert@creativequeries.com"]
  gem.description   = %q{RubyHue is a library for interacting with Hue light bulbs from Phillips.}
  gem.summary       = %q{RubyHue is a library for interacting with Hue light bulbs from Phillips.}
  gem.homepage      = "http://github.com/bobbytables/ruby_hue"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.13.0"
  gem.add_development_dependency "awesome_print", "~> 1.1.0"
  gem.add_development_dependency "webmock", "~> 1.11.0"
  gem.add_development_dependency "typhoeus", "~> 0.6.2"
  gem.add_development_dependency "guard-rspec", "~> 2.5.1gua"

  gem.add_runtime_dependency "httparty", "~> 0.10.2"
  gem.add_runtime_dependency "multi_json", "~> 1.7.2"
end
