require 'rubygems'
require 'test/unit'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra/i18n'

class Test::Unit::TestCase
  def self.test_name(name)
    "test_#{name.gsub(/\W+/, ' ').gsub(/\s+/,'_')}".to_sym
  end

  def self.test(name, &block)
    define_method(test_name(name), &block)
  end
end

