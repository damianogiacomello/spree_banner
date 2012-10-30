# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_banner'
  s.version     = '1.2.0'
  s.summary     = 'Extension to manage banner for you Spree Shop'
  s.required_ruby_version = '>= 1.8.7'

  s.author      = 'Damiano Giacomello'
  s.email       = 'damiano.giacomello@diginess.it'

  #s.files         = `git ls-files`.split("\n")
  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.2.0'
  
  s.add_dependency 'formtastic'
  s.add_dependency 'paperclip'
  s.add_dependency 'aws-sdk'
  
  s.add_development_dependency 'rspec-rails'
end

