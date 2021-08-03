# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "banktools-at/version"

Gem::Specification.new do |spec|
  spec.name          = "banktools-at"
  spec.version       = BankTools::AT::VERSION
  spec.authors       = [ "Henrik Nyh", "Kim Persson" ]
  spec.email         = [ "devs@auctionet.com" ]

  spec.summary       = %q{Validate Austrian bank account numbers.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  spec.add_dependency "attr_extras"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
