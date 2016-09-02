class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.create(display_name: params["display_name"], username: params["username"], password: params["password"])
    redirect to "/create_show"
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    redirect to "/users/#{@user.slug}/shows"
  end

end
