[![Build Status](https://secure.travis-ci.org/sdalu/sinatra-i18n.png)](http://travis-ci.org/sdalu/sinatra-i18n)

sinatra-i18n
============

Basic plugin to use internationalization on your sinatra application

How to use
----------

This works for both the case of a Classic sinatra application and also
for Sinatra::Base types.

On your sinatra application:

    require 'sinatra/i18n'
    
    # Optional requirements
    require 'rack/contrib' 
    require 'i18n/backend/fallbacks'
    
    # Register the extension
    register Sinatra::I18n
    
    # Use browser preference to set locale
    #  (requires: rack-contrib)
    use Rack::Locale
    
    # Use URL information to set locale
    before '/:locale/*' do
        I18n.locale       =       params[:locale]
        request.path_info = '/' + params[:splat]
    end
    
    # Use hostname information to set locale
    #  (assume hostname is as: locale.my-website.com)
    before '/:locale/*' do
        if (locale = request.host.split('.')[0]) != 'www'
            I18n.locale = locale
        end
    end    
    
    # Configure I18n translations
    # Loading translation files with modified backend
    #  (requires: i18n/backend/fallbacks)
    configure
        I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
        I18n.load_path, Dir[File.join(settings.root, 'locales', '*.yml')]
        I18n.backend.load_translations
    end

    # Configure the way templates view will be looked up
    #  (this is the default configuration)
    configure
        set :locales, :lookup => lambda {|path, locale| "#{name}.#{locale}" }
    end

    # Display a welcome screen with localized information
    #  - view is displayed according to locale 
    #    will look for current, default, fallbacks vesion of the view:
    #        view.fr, view.en, ..., view.jp, view
    #  - message is translated
    #  - time is localised
    get '/welcome' do
      erb :welcome_screen, locals => { :message => t(:message),
                                       :time    => l(Time.now) }
    end




Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright 
---------

Copyright (c) 2010 Sinefunc. See LICENSE for details.
