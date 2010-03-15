sinatra-i18n
============

Basic plugin to use internationalization on your sinatra application

How to use
----------

On your sinatra application:

    require 'sinatra/i18n'

    # this is required if you want to assume the default path
    set :root, File.dirname(__FILE__)

    # an alternative would be to set the locales path
    set :locales, File.join(File.dirname(__FILE__), 'config/en.yml')
  
    # then just register the extension
    register Sinatra::I18n


This works for both the case of a Classic sinatra application and also for Sinatra::Base types.

In your helpers / routes
------------------------

Once this is done you can go on and use `t` e.g.

    post '/items' do
      session[:message] = t('items_success')
      redirect '/items' 
    end

    # in your view
    - if session[:message]
      = session.delete(:message)

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
