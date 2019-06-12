require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/author'

get '/authors' do
  @authors = Author.all
  @authors.sort_by! { | author | author.pretty_name }
  erb(:'authors/index')
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
  @books.sort_by! { | book | book.name }
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