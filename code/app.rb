require 'sinatra'
require 'sinatra/contrib/all'
also_reload('./models')

get '/' do
  erb(:index)
end