Gem::Specification.new do |s|
  s.name        = 'listen_and_write'
  s.version     = '0.0.0'
  s.license     = 'MIT'
  s.date        = '2013-10-27'
  s.summary     = "Practice foreign language by listening and writing."
  s.description = "Practice foreign language by listening and writing (only for Mac OS X)."
  s.authors     = ["Jing Li"]
  s.email       = 'thyrlian@gmail.com'
  s.homepage    = 'http://github.com/thyrlian/listen_and_write'
  s.files       = %w[
    lib/listen_and_write.rb
    lib/listen_and_write/word.rb
    lib/listen_and_write/tts.rb
    lib/listen_and_write/serializer.rb
    lib/listen_and_write/operating_system.rb
    lib/listen_and_write/teacher.rb
  ]
end