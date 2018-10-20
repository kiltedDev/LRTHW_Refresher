# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "gothonweb3"
  spec.version       = '1.0'
  spec.authors       = ["Thomas Wilson"]
  spec.email         = ["kilted.dev@gmail.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "https://domainforproject.com"
  spec.license      = "MIT"

  spec.files         = ['lib/gothonweb3.rb']
  spec.executables   = ['bin/gothonweb3']
  spec.test_files    = ['tests/test_gothonweb3.rb']
  spec.require_paths = ["lib"]
end
