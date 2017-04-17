require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
# Load the file to connect to the DB
require_relative 'db/connection'

require_relative 'models/pokemon'
# require_relative 'models/trainer'

get '/' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end
