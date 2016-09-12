class ShowsController < ApplicationController

  ######## SHOW INDEX #########
  get '/shows' do
    if logged_in?
      @user = current_user
      @current_user_shows = current_user.shows
      random_show
      erb :'/shows/list_shows'
    else
      flash[:message] = "Gotta log in before you can do that."
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
      flash[:message] = "Gotta log in before you can do that."
      redirect '/login'
    end
  end

  post '/shows' do
    if valid_submission?
      @show = current_user.shows.build(title: params["title"])
      @show.save
      set_show_genre
      set_show_length
      @show.save
      redirect '/shows'
    else
      flash[:message] = "Every field needs to be filled out, make sure your show has a Title, a Genre, and a Length."
      redirect '/shows/new'
    end
  end

  ######## SHOW DETAILS #########
  get '/shows/:id' do
    @show = Show.find(params["id"])
    if logged_in? && @show.user_id == current_user.id
      random_show
      erb :'/shows/show_details'
    elsif logged_in?
      flash[:message] = "That's not your show to view!"
      redirect '/shows'
    else
      flash[:message] = "Gotta log in before you can do that."
      redirect '/login'
    end
  end

  ######## EDIT SHOW #########
  get '/shows/:id/edit' do
    @show = Show.find(params["id"])
    if !logged_in?
      flash[:message] = "Gotta log in before you can do that."
      redirect '/login'
    elsif @show.user_id == current_user.id
      @genres = Genre.all
      @lengths = Length.all
      @show = Show.find(params["id"])
      erb :'/shows/edit_show'
    else
      flash[:message] = "That's not your show to edit!"
      redirect '/shows'
    end
  end

  patch '/shows/:id' do
    @show = Show.find(params["id"])
    random_show
    genre_id = (params["show_genre"].to_i)
    length_id = (params["show_length"].to_i)
    if !(params["title"] == "")
      @show.update(title: params["title"])
    end
    if !(@show.genre_id == genre_id)
      if !(params["show_genre"] == "")
        @show.update(genre_id: genre_id)
      else
        new_genre = Genre.create(name: params["new_genre"])
        @show.update(genre_id: new_genre.id)
      end
    end
    if !(@show.length_id == length_id)
      if !(params["show_length"] == "")
        @show.update(length_id: length_id)
      else
        new_length = Length.create(length_description: params["new_length"])
        @show.update(length_id: new_length.id)
      end
    end
    erb :'/shows/show_details'
  end

  ######## DELETE SHOW #########

  get '/shows/:id/delete' do
    @show = Show.find(params["id"])
    if !logged_in?
      flash[:message] = "Gotta log in before you can do that."
      redirect '/login'
    elsif @show.user_id == current_user.id
      @show.destroy
      flash[:message] = "Show has been deleted!"
      redirect '/shows'
    else
      flash[:message] = "That's not your show to delete!"
      redirect '/shows'
    end
  end

  delete '/shows/:id/delete' do
    @show = Show.find(params["id"])
    if !logged_in?
      flash[:message] = "Gotta log in before you can do that."
      redirect '/login'
    elsif @show.user_id == current_user.id
      @show.destroy
      redirect '/shows'
    else
      flash[:message] = "That's not your show to delete!"
      redirect '/shows'
    end
  end

  helpers do
    def set_show_genre
      if genre_dropdown_blank?
        @show.genre_id = Genre.create(name: params["new_genre"]).id
      else
        @show.genre_id = params["show_genre"].to_i
      end
    end

    def set_show_length
      if length_dropdown_blank?
        @show.length_id = Length.create(length_description: params["new_length"]).id
      else
        @show.length_id = params["show_length"].to_i
      end
    end

    def valid_submission?
      !(params["title"] == "") && (!genre_dropdown_blank? || !new_genre_field_blank?) && (!length_dropdown_blank? || !new_length_field_blank?)
    end

    def genre_dropdown_blank?
      params["show_genre"] == ""
    end

    def new_genre_field_blank?
      params["new_genre"] == ""
    end

    def length_dropdown_blank?
      params["show_length"] == ""
    end

    def new_length_field_blank?
      params["new_length"] == ""
    end
  end

end
