require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/author'

get '/authors' do
  @authors = Author.all
  erb(:'authors/index')
end

get '/authors/:id' do
  @books = Author.books
  @author = Author.find(id)
  erb(:'authors/show')
end

