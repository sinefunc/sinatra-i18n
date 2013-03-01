# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new 'sinatra-i18n', '0.2.0' do |s|
  s.summary          = "A barebones Sinatra i18n extension"
  s.description      = "Ease internationalisation (i18n) with Sinatra"
  s.authors          = [ "Stephane D'Alu", "Cyril David" ]
  s.email            = %q{cyx.ucron@gmail.com}
  s.homepage         = %q{http://github.com/sinefunc/sinatra-i18n}
# s.files            = `git ls-files`.split("\n") - %w[.gitignore .travis.yml]
  s.files            = [ '.document',
			 'Gemfile',
			 'LICENSE',
			 'README.md',
			 'Rakefile',
			 'VERSION',
			 'lib/sinatra/i18n.rb',
			 'sinatra-i18n.gemspec',
			 'test/helper.rb',
			 'test/locales/en.yml',
			 'test/locales/fr.yml',
			 'test/sinatra-i18n_test.rb',
			 'test/views/welcome.erb',
			 'test/views/welcome.fr.erb'
		       ]
  s.test_files       = s.files.select { |p| p =~ /^test\/.*_test.rb/ }
  s.extra_rdoc_files = s.files.select { |p| p =~ /^README/ } << 'LICENSE'

  s.rdoc_options     = [ "--charset=UTF-8" ]

  s.require_paths    = [ "lib" ]

  s.add_dependency 'sinatra'
  s.add_dependency 'i18n'
end

