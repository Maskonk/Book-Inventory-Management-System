require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/book'

get '/books' do
  @books = Book.all
  erb(:'books/index')
end

get '/books/new' do
  @authors = Author.all
  erb(:'books/new')
end

get '/books/:id/edit' do
  @book = Book.find(params[:id].to_i)
  @authors = Author.all
  erb(:'books/edit')
end


get '/book/:id' do
  @book = Book.find(params[:id].to_i)
  erb(:'book/show')
end


post '/books' do
  @book = Book.new(params)
  @book.save
  redirect '/books'
end

post '/books/:id/delete' do
  book = Book.find(params['id'].to_i)
  book.delete
  redirect '/books'
end

post '/books/:id' do
  @book = Book.new(params)
  @book.update
  redirect '/books'
end
