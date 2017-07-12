# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/app_version/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-app_version'
  spec.version       = Rack::AppVersion::VERSION
  spec.authors       = ['Wilfrido T. Nuqui Jr.']
  spec.email         = ['dofreewill22@gmail.com']

  spec.summary       = 'Middleware that sets app version in response header.'
  spec.description   = 'Middleware that sets app version in response header.'
  spec.homepage      = 'https://github.com/wnuqui/rack-app_version'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
