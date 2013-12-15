Gem::Specification.new do |s|
  s.name        = 'dictation'
  s.version     = '1.0.4'
  s.license     = 'MIT'
  s.date        = '2013-12-15'
  s.summary     = "Practice foreign language by listening and writing."
  s.description = "Practice foreign language by listening and writing (only for Mac OS X)."
  s.authors     = ['Jing Li']
  s.email       = ['thyrlian@gmail.com']
  s.homepage    = 'http://github.com/thyrlian/dictation'
  s.files       = %w[
    lib/dictation.rb
    lib/dictation/operating_system.rb
    lib/dictation/word.rb
    lib/dictation/serializer.rb
    lib/dictation/tts.rb
    lib/dictation/teacher.rb
    lib/dictation/typewriter.rb
    lib/dictation/commander.rb
    lib/dictation/control_center.rb
    bin/dictation
  ]
  s.executables = ['dictation']
end