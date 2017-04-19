$:.push File.expand_path('../lib', __FILE__)

require 'res/version'

Gem::Specification.new do |s|
  s.name        = 'res'
  s.version     = Res::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = 'Test Result report libraries'
  s.description = 'Formatters, parsers, and submitters for test results'
  s.authors     = ['BBC', 'David Buckhurst', 'Asim Khan']
  s.email       = ['david.buckhurst@bbc.co.uk', 'asim.khan.ext@bbc.co.uk']
  s.files       = Dir['README.md', 'lib/**/*.rb', 'bin/res' ]
  s.executables = ['res']
  s.homepage    = 'https://github.com/bbc/res'
  s.license     = 'MIT'
  s.add_runtime_dependency 'json', '~> 1.8'
  s.add_runtime_dependency 'test_rail-api', '~> 0.4.1'
  s.add_runtime_dependency 'ox', '~> 2.2'
  s.add_runtime_dependency 'hive-messages', '~> 1'
  s.add_development_dependency 'rspec', '~>3.2'
end
