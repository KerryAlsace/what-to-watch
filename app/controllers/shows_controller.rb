class ShowsController < ApplicationController
  helpers ShowHelpers

  ######## SHOW INDEX #########
  get '/shows' do
    if logged_in?
      @user = current_user
      @current_user_shows = current_user.shows
      random_show
      erb :'/shows/list_shows'
    else
      login_warning_message
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
      login_warning_message
      redirect '/login'
    end
  end

  post '/shows' do
    if valid_submission?
      @show = current_user.shows.build(title: params["title"])
      @show.save
      @show.set_show_genre(params)
      @show.set_show_length(params)
      @show.save
      redirect '/shows'
    else
      complete_form_warning_message
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
      owner_warning_message
      redirect '/shows'
    else
      login_warning_message
      redirect '/login'
    end
  end

  ######## EDIT SHOW #########
  get '/shows/:id/edit' do
    @show = Show.find(params["id"])
    if !logged_in?
      login_warning_message
      redirect '/login'
    elsif @show.user_id == current_user.id
      @genres = Genre.all
      @lengths = Length.all
      @show = Show.find(params["id"])
      erb :'/shows/edit_show'
    else
      owner_warning_message
      redirect '/shows'
    end
  end

  patch '/shows/:id' do
    @show = Show.find(params["id"])
    random_show
    @show.edit_show(params)
    erb :'/shows/show_details'
  end

  ######## DELETE SHOW #########

  get '/shows/:id/delete' do
    @show = Show.find(params["id"])
    if !logged_in?
      login_warning_message
      redirect '/login'
    elsif @show.user_id == current_user.id
      @show.destroy
      show_deleted_message
      redirect '/shows'
    else
      owner_warning_message
      redirect '/shows'
    end
  end

  delete '/shows/:id/delete' do
    @show = Show.find(params["id"])
    if !logged_in?
      login_warning_message
      redirect '/login'
    elsif @show.user_id == current_user.id
      @show.destroy
      redirect '/shows'
    else
      owner_warning_message
      redirect '/shows'
    end
  end

end
