require File.expand_path('../helper', __FILE__)

require 'sinatra/base'
require 'sinatra/i18n'

class TestSinatraI18n < Test::Unit::TestCase
    test 'translation for en' do
        i18n_app_result(:en) { t(:'world') }
        assert_equal body, 'World'
    end


    test 'translation for fr' do
        i18n_app_result(:fr) { t(:'world') }
        assert_equal body, 'Monde'

    end


    test 'template lookup for missing locale' do
        i18n_app_result(:en) { erb :'welcome' }
        assert_equal body, 'Hello World'
    end

    test 'template lookup for locale' do
        i18n_app_result(:fr) { erb :'welcome' }
        assert_equal body, 'Bonjour Monde'
    end

    #----------------------------------------------------------------------

    def i18n_app(&block) 
        mock_app do
            register Sinatra::I18n 

            configure do
                I18n.load_path = Dir[File.join(File.dirname(__FILE__),
                                               'locales', '*.yml')]
                I18n.backend   = I18n::Backend::Simple.new
                I18n.backend.load_translations
            end

            instance_eval(&block)
        end
    end

    def i18n_app_result(locale = :en, &block)
        i18n_app do
            get '/' do
                I18n.locale = locale
                instance_eval(&block)
            end
        end
        get '/'
    end
end
