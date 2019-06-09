require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/author'

get '/authors' do
  @authors = Author.all
  erb(:'authors/index')
end

get '/authors/:id' do
  p "APPLES #{params[:id].to_i}"
  @author = Author.find(params[:id].to_i)
  @books = @author.books

  erb(:'authors/show')
end

