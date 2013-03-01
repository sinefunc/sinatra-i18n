# -*- ruby -*-

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

version = File.exist?('VERSION') ? File.read('VERSION') : "?.?.?"

Gem::Specification.new 'sinatra-i18n', '0.2.0' do |s|
  s.summary          = "A barebones Sinatra i18n extension"
  s.description      = "Ease internationalisation (i18n) with Sinatra"
  s.authors          = [ "Stephane D'Alu", "Cyril David" ]
  s.email            = %q{cyx.ucron@gmail.com}
  s.homepage         = %q{http://github.com/sinefunc/sinatra-i18n}
  s.files            = `git ls-files`.split("\n") - %w[.gitignore .travis.yml]
  s.test_files       = s.files.select { |p| p =~ /^test\/.*_test.rb/ }
  s.extra_rdoc_files = s.files.select { |p| p =~ /^README/ } << 'LICENSE'

  s.rdoc_options     = [ "--charset=UTF-8" ]

  s.require_paths    = [ "lib" ]

  s.add_dependency 'sinatra'
  s.add_dependency 'i18n'


  s.add_development_dependency 'rake'
  s.add_development_dependency 'rack-test'
end

