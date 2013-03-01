# $Id$

require 'i18n'

module Sinatra
  module I18n
    module Helpers
      # Shortcuts to translate and localise
      def t(*args)
        ::I18n::t(*args)
      end

      def l(*args)
        ::I18n::l(*args)
      end

      # Look for localised versions of view templates
      def find_template(views, name, engine, &block)
          locales = if ::I18n.respond_to?(:fallbacks)
                        ::I18n.fallbacks[::I18n.locale]
                    elsif ::I18n.locale != ::I18n.default_locale
                        [ ::I18n.locale, ::I18n.default_locale ].compact
                    else
                        []
                    end
          lookup  = settings.locales.lookup ||
                    lambda { |path, locale| "#{name}.#{locale}" }
          locales.each { |locale|
              super(views, lookup.call(name, locale), engine, &block) }
          super(views, name, engine, &block)
      end
    end

    def self.registered(app)
      app.helpers I18n::Helpers

      app.set :locales, {}
    end
  end
end
