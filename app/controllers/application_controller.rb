require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  helpers ApplicationHelpers
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
end
