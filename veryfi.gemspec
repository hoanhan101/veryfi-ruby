# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "veryfi/version"

Gem::Specification.new do |spec|
  spec.name          = "veryfi"
  spec.version       = Veryfi::VERSION
  spec.authors       = ["Veryfi"]
  spec.email         = ["support@veryfi.com"]

  spec.summary       = "Veryfi SDK for Ruby"

  spec.homepage      = "https://rubygems.org/gems/veryfi"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license = "MIT"

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "openssl", "~> 2.2"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "bundler-audit", "~> 0.6"
  spec.add_development_dependency "pry", "~> 0.14"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rspec-its", "~> 1.3"
  spec.add_development_dependency "rubocop", "~> 0.82"
  spec.add_development_dependency "rubocop-rspec", "~> 1.38"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "webmock", "~> 3.14"
end
