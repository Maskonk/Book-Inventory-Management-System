require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/category'

get '/categories' do
  @categories = Category.all
  erb(:'categories/index')
end

get '/categories/new' do
  erb(:'categories/new')
end

get '/categories/:id/edit' do
  @category = Category.find(params[:id].to_i)
  erb(:'categories/edit')
end

get '/categories/:id' do
  @category = Category.find(params[:id].to_i)
  @books = @category.books
  erb(:'categories/show')
end

post '/categories' do
  @category = Category.new(params)
  @category.save
  redirect '/categories'
end

post '/categories/:id/delete' do
  category = Category.find(params['id'].to_i)
  category.delete
  redirect '/categories'
end

post '/categories/:id' do
  @category = Category.new(params)
  @category.update
  redirect '/categories'
end
