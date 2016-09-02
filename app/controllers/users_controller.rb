class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/users/#{@user.slug}/shows"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new
    @user.display_name = params["display_name"]
    @user.username = params["username"]
    @user.password = params["password"]
    if @user.save
      login(params["username"], params["password"])
      redirect to "/create_show"
    else
      redirect to "/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{@user.slug}/shows"
    else
      erb :'/users/login'
    end
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
