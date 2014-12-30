# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monitor_log/version'

Gem::Specification.new do |spec|
  spec.name          = "monitor_log"
  spec.version       = MonitorLog::VERSION
  spec.authors       = ["Phillip Dudley"]
  spec.email         = ["Phillip.Dudley@cerner.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  # The gem, even though its requried, doesn't need to be listed here.
  spec.add_development_dependency "warbler"
  spec.add_runtime_dependency "warbler"

end
