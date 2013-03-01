# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new 'sinatra', '0.1.0' do |s|
  s.summary          = "A barebones Sinatra i18n extension"
  s.description      = "ease internationalisation (i18n) of Sinatra"
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
end

