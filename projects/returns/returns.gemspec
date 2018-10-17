# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "returns"
  spec.version       = '1.0'
  spec.authors       = ["Thomas Wilson"]
  spec.email         = ["kilted.dev@gmail.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "https://domainforproject.com"
  spec.license      = "MIT"

  spec.files         = ['lib/returns.rb']
  spec.executables   = ['bin/returns']
  spec.test_files    = ['tests/test_returns.rb']
  spec.require_paths = ["lib"]
end
