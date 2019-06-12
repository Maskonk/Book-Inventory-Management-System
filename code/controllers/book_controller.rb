require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/book'

get '/books' do
  @books = Book.all
  @books.sort_by! { | book | book.name }
  erb(:'books/index')
end

get '/books/new' do
  @authors = Author.all
  @categories = Category.all
  erb(:'books/new')
end

get '/books/low' do
  @books = Book.low_stock
  erb(:'books/low')
end

get '/books/:id/edit' do
  @book = Book.find(params[:id].to_i)
  @categories = Category.all
  @authors = Author.all
  erb(:'books/edit')
end


get '/books/:id' do
  @book = Book.find(params[:id].to_i)
  erb(:'books/show')
end

post '/books/sorted' do
  @books = Book.all_sort(params['order'])
  erb(:'books/index')
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
