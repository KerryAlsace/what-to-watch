require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "whatchya_watchin"
  end

  get '/' do
    if logged_in?
      @user = current_user
      random_show
      erb :'/users/welcome'
    else
      erb :index
    end
  end

  helpers do

    def login(username, password)
      @user = User.find_by(username: username)
      if @user && @user.authenticate(password)
        session["username"] = @user.username
        session["display_name"] = @user.display_name
      else
        flash[:message] = "We don't recognize that username and password combo, try again."
        redirect to '/login'
      end
    end

    def current_user
      @current_user ||= User.find_by(username: session["username"]) if session["username"]
    end

    def logged_in?
      !!current_user
    end

    def logout!
      session.clear
    end

    def random_show
      if current_user.shows
        @random_show = (current_user.shows.sample).id
      end
    end

  end

end
