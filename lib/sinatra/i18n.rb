require 'i18n'

module Sinatra
  module I18n
    module Helpers
      def t(*args)
        ::I18n::t(*args)
      end
    end

    def self.registered(app)
      app.helpers I18n::Helpers

      unless defined?(app.locales)
        app.set :locales, File.join(app.root, 'config', 'locales', 'en.yml')
      end

      ::I18n.backend.load_translations(app.locales)
    end
  end
end
