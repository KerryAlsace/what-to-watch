class ShowsController < ApplicationController

  ######## SHOW INDEX #########
  get '/shows' do
    if logged_in?
      @user = current_user
      @current_user_shows = current_user.shows
      @show_slug = (Show.all.sample).slug
      erb :'/shows/list_shows'
    else
      redirect '/login'
    end
  end

  ######## CREATE SHOW #########
  get '/shows/new' do
    if logged_in?
      @genres = Genre.all
      @lengths = Length.all
      @user = current_user
      erb :'/shows/create_show'
    else
      redirect '/login'
    end
  end

  post '/shows' do
    if !(params["title"] == "" && params["genre"] == "" && params["length"] == "")
      @show = Show.create(title: params["title"], genre: params["genre"], length: params["length"])
      @show.user = current_user
      @show.save
      redirect '/shows'
    else
      redirect '/shows/new'
    end
  end

  ######## SHOW DETAILS #########
  get '/shows/:slug' do
    @show = Show.find_by_slug(params["slug"])
    if logged_in? && @show.user_id == current_user.id
      @show_slug = (Show.all.sample).slug
      erb :'/shows/show_details'
    elsif logged_in?
      redirect '/shows'
    else
      redirect '/login'
    end
  end

  ######## EDIT SHOW #########
  get '/shows/:slug/edit' do
    if logged_in?
      @genres = Genre.all
      @lengths = Length.all
      @show = Show.find_by_slug(params["slug"])
      erb :'/shows/edit_show'
    else
      redirect '/login'
    end
  end

  patch '/shows/:slug' do
    @show = Show.find_by_slug(params["slug"])
    genre_id = (params["show_genre"].to_i)
    length_id = (params["show_length"].to_i)
    if !(params["title"] == "")
      @show.update(title: params["title"])
    end
    if !(@show.genre_id == genre_id)
      @show.update(genre_id: genre_id)
    end
    if !(@show.length_id == length_id)
      @show.update(length_id: length_id)
    end
    erb :'/shows/show_details'
  end

  ######## DELETE SHOW #########

  # this doesn't work anymore and i don't know why
  delete '/shows/:slug/delete' do
    @show = Show.find_by_slug(params["slug"])
    if !logged_in?
      redirect '/login'
    elsif @show.user_id == current_user.id
      @show.destroy
      redirect '/shows'
    else
      redirect '/shows'
    end
  end

end
