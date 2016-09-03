require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "whatchya_watchin"
  end

  get '/' do
    if logged_in?
      @user = current_user
      @show_slug = (current_user.shows.sample).slug
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

  end

end
