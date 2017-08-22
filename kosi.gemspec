# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kosi/version'

Gem::Specification.new do |spec|
  spec.name          = 'kosi'
  spec.version       = Kosi::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = %q(terminal table format for japanese)
  spec.description   = %q(terminal table format for japanese)
  spec.homepage      = 'https://github.com/tbpgr/kosi'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'unicode', '>= 0.4.4'

  spec.add_development_dependency 'bundler', '~> 1.15.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.6.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
  spec.add_development_dependency 'coveralls'
end
