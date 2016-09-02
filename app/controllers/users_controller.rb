class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/shows'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    user = User.create(display_name: params["display_name"], username: params["username"], password: params["password"])
    if user.save
      login(params["username"], params["password"])
      redirect to "/shows/new"
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/shows'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    login(params["username"], params["password"])
    redirect to "/shows"
  end

  get '/logout' do
    logout!
    redirect to "/login"
  end

end
