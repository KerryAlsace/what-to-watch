class ShowsController < ApplicationController

  get '/shows' do
    @user = current_user
    @current_user_shows = current_user.shows
    erb :'/shows/list_shows'
  end

  get '/shows/new' do
    @user = current_user
    erb :'/shows/create_show'
  end

  post '/shows' do
    @show = Show.create(title: params["title"], genre: params["genre"], length: params["length"])
    @show.user = current_user
    @show.save
    redirect '/shows'
  end



end
