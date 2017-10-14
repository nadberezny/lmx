# coding: utf-8

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Dir["#{lib}/lmx/*.rb"].each { |file| require file }

Gem::Specification.new do |spec|
  spec.name          = 'lmx'
  spec.version       = Lmx::VERSION
  spec.authors       = ['Juliusz Nadberezny']
  spec.email         = ['nadberezny@gmail.com']

  spec.summary       = 'DSL for building XML'
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
