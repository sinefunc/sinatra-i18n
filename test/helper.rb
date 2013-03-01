require 'rubygems'
require 'test/unit'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rack/test'
require 'sinatra/base'


class Sinatra::Base
  include Test::Unit::Assertions
end


class Test::Unit::TestCase
    include Rack::Test::Methods


    def self.test_name(name)
        "test_#{name.gsub(/\W+/, ' ').gsub(/\s+/,'_')}".to_sym
    end
    
    def self.test(name, &block)
        define_method(test_name(name), &block)
    end

    ##################################################

    def mock_app(base=Sinatra::Base, &block)
        @app = Sinatra.new(base, &block)
    end

    def app
        Rack::Lint.new(@app)
    end

    alias_method :response, :last_response
    
    def body
        response.body.to_s
    end
end

