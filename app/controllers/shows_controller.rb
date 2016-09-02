class ShowsController < ApplicationController

  get '/shows' do
    @user = current_user
    erb :'/shows/list_shows'
  end

  get '/shows/new' do
    @user = current_user
    erb :'/shows/create_show'
  end



end
