require 'rake/clean'
require 'rake/testtask'


# SPECS ===============================================================

task :test do
  ENV['LANG'] = 'C'
  ENV.delete 'LC_CTYPE'
end

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*_test.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
  t.ruby_opts << '-I.'
end

Rake::TestTask.new(:"test:core") do |t|
  core_tests = %w[base delegator encoding extensions filter
helpers mapped_error middleware radius rdoc
readme request response result route_added_hook
routing server settings sinatra static templates]
  t.test_files = core_tests.map {|n| "test/#{n}_test.rb"}
  t.ruby_opts = ["-rubygems"] if defined? Gem
  t.ruby_opts << "-I."
end


#==================================================

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sinatra-i18n #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
