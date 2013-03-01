# -*- ruby -*-
require 'rake/clean'
require 'rake/testtask'
require 'rdoc/task'

version = File.exist?('VERSION') ? File.read('VERSION') : "?.?.?"


task :default => :test


task :test do
  ENV['LANG'] = 'C'
  ENV.delete 'LC_CTYPE'
end


Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*_test.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
  t.ruby_opts << '-I.'
end



Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "sinatra-i18n #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
