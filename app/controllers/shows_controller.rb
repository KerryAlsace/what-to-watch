class ShowsController < ApplicationController

  get '/shows/new' do
    @user = current_user
    erb :'/shows/create_show'
  end

end
