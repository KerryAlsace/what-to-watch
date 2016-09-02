class ShowsController < ApplicationController

  get '/shows/new' do
    erb :'/shows/create_show'
  end

end
