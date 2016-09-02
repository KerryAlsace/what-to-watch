class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new
    @user.display_name = params["display_name"]
    @user.username = params["username"]
    @user.password = params["password"]
    login(params["username"], params["password"])
    redirect to "/shows/new"
  end

  get '/login' do
      erb :'/users/login'
  end

  post '/login' do
    login(params["username"], params["password"])
    redirect to "/users/#{@user.slug}/shows"
  end

  get '/users/:slug/shows' do
    @user = User.find_by_slug(params[:slug])
    erb :'/shows/list_shows'
  end

  get '/logout' do
    logout!
    redirect to "/login"
  end

end
