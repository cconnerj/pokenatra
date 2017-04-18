require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
# Load the file to connect to the DB
require_relative 'db/connection'

require_relative 'models/pokemon'
require_relative 'models/trainer'

get '/' do
  @trainers = Trainer.all
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/trainers/new' do
  erb :"trainers/new"
end

get '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end

get "/trainers/:id/edit" do
  @trainer = Trainer.find(params[:id])
  erb(:"trainers/edit")
end

post '/trainers' do
  @trainer = Trainer.create(name: params[:name], level: params[:level], img_url: params[:img_url])
  redirect "/trainers/#{@trainer.id}"
end

get '/pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

post '/pokemons' do
  @pokemon = Pokemon.create(name: params[:name], poke_type: params[:poke_type], cp: params[:cp], img_url: params[:img_url])
  redirect "/pokemons/#{@pokemon.id}"
end

get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemons/edit")
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemons/#{@pokemon.id}")
end

put '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect("/trainers/#{@trainer.id}")
end

# delete '/pokemons/:id' do
#   @pokemon = Pokemon.find(params[:id])
#   @pokemon.destroy
#   redirect("/pokemons")
# end
