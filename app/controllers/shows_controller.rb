class ShowsController < ApplicationController

  ######## SHOW INDEX #########
  get '/shows' do
    @user = current_user
    @current_user_shows = current_user.shows
    erb :'/shows/list_shows'
  end

  ######## CREATE SHOW #########
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

  ######## SHOW DETAILS #########
  get '/shows/:slug' do
    @show = Show.find(params["slug"])
    erb :'/shows/show_details'
  end

  ######## EDIT SHOW #########
  get '/shows/:slug/edit' do
    @show = Show.find(params["slug"])
    erb :'/shows/edit_show'
  end

  patch '/shows/:slug' do
    @show = Show.find(params["slug"])
    @show.update(title: params["title"], genre: params["genre"], length: params["length"])
    erb :'/shows/show_details'
  end

  ######## DELETE SHOW #########

  post 'shows/:slug/delete' do
    @show = Show.find(params["slug"])
    @show.destroy
    redirect '/shows'
  end

end
