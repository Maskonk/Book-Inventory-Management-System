require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/author'

get '/books' do
  @authors = Author.all
  erb(:'books/index')
end

get '/authors/new' do
  erb(:'authors/new')
end

get '/authors/:id/edit' do
  @author = Author.find(params[:id].to_i)
  erb(:'authors/edit')
end


get '/authors/:id' do
  @author = Author.find(params[:id].to_i)
  @books = @author.books
  erb(:'authors/show')
end


post '/authors' do
  @author = Author.new(params)
  @author.save
  redirect '/authors'
end

post '/authors/:id/delete' do
  author = Author.find(params['id'].to_i)
  author.delete
  redirect '/authors'
end

post '/authors/:id' do
  @author = Author.new(params)
  @author.update
  redirect '/authors'
end
