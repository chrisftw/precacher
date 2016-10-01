Gem::Specification.new do |s|
  s.name        = 'precacher'
  s.version     = '0.0.1'
  s.date        = '2016-10-01'
  s.summary     = "Update static files with dynamic data."
  s.description = "Precacher make sit simple to keep static files up to data with dynamic data that could change minute to minute."
  s.authors     = ["Chris Reister"]
  s.email       = 'chris@chrisreister.com'
  s.files       = ["lib/precacher.rb"]
  s.homepage    = 'https://github.com/chrisftw/precacher'
  s.license     = 'MIT'
  
  # might work with older development_dependencies.
  s.add_development_dependency 'minitest', '~> 3.0'
end
