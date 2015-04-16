class PigeonsController < ApplicationController

  get '/' do
    redirect '/pigeons'
  end

  # Show all pigeons
  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  # Form to set attributes for a new Pigeon
  get '/pigeons/new' do
    erb :"/pigeons/new"
  end

  # Form is posted thus pigeon is created and added to database
  post '/pigeons' do
    @pigeon = Pigeon.new(params)
    @pigeon.name = params["name"]
    @pigeon.color = params["color"]
    @pigeon.gender = params["gender"]
    @pigeon.lives = params["lives"]
    @pigeon.save
    redirect '/pigeons'
  end

  # Show one pigeon
    get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :"pigeons/show"
  end

  # Edit one pigeon
  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :"/pigeons/edit"
  end

  # Update one pigeon
  patch '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.update_attributes(name: params["name"], color: params["color"], gender: params["gender"], lives: params["lives"])
    redirect "/pigeons/#{@pigeon.id}"
  end

  # Delete a pigeon
  delete '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect "/pigeons"
  end

end