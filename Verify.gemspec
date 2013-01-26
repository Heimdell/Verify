# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Verify/version'

Gem::Specification.new do |gem|
  gem.name          = "Verify"
  gem.version       = Verify::VERSION
  gem.authors       = ["Heimdell"]
  gem.email         = ["hindmost.one@gmail.com"]
  gem.description   = "Test framework"
  gem.summary       = "YA Test Framework"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.executables << 'verify'
end
