require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/author_controller'
require_relative 'controllers/book_controller'
also_reload('/models')

get '/' do
  erb(:index)
end