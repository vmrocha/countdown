require_relative 'lib/super_countdown/version'

Gem::Specification.new do |s|
  s.name        = 'super_countdown'
  s.version     = SuperCountdown::VERSION
  s.summary     = 'A super simple countdown timer'
  s.description = 'Displays a countdown timer to a specified future date with millisecond precision'
  s.authors     = ['Vinicius de Melo Rocha']
  s.email       = 'vmrocha@gmail.com'
  s.files       = Dir['lib/**/*'] + ['LICENSE']
  s.executables << 'super_countdown'
  s.homepage    = 'https://github.com/vmrocha/super_countdown'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.5.0'

  s.add_development_dependency 'rspec', '~> 3.13'
  s.add_development_dependency 'timecop', '~> 0.9.10'
end
