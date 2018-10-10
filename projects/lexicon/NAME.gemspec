# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Lexicon"
  spec.version       = '1.0'
  spec.authors       = ["Thomas Wilson"]
  spec.email         = ["kilted.dev@gmail.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "https://domainforproject.com"
  spec.license      = "MIT"

  spec.files         = ['lib/NAME.rb']
  spec.executables   = ['bin/Lexicon']
  spec.test_files    = ['tests/test_Lexicon.rb']
  spec.require_paths = ["lib"]
end
