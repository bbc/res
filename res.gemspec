Gem::Specification.new do |s|
  s.name        = 'res'
  s.version     = '0.3.0'
  s.date        = '2015-03-18'
  s.summary     = 'Test Result report libraries'
  s.description = 'Formatters, parsers, and submitters for test results'
  s.authors     = ['David Buckhurst']
  s.email       = 'david.buckhurst@bbc.co.uk'
  s.files       = Dir['README.md', 'lib/**/*.rb' ]
  s.homepage    = 'https://github.com/bbc/res'
  s.license     = 'MIT'
  s.add_runtime_dependency 'json'
  s.add_development_dependency 'rspec'
end
