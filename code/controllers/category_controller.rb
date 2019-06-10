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

# get '/authors/:id/edit' do
#   @author = Author.find(params[:id].to_i)
#   erb(:'authors/edit')
# end
#
#
# get '/authors/:id' do
#   @author = Author.find(params[:id].to_i)
#   @books = @author.books
#   erb(:'authors/show')
# end
#
#
post '/categories' do
  @category = Category.new(params)
  @category.save
  redirect '/categories'
end
#
# post '/authors/:id/delete' do
#   author = Author.find(params['id'].to_i)
#   author.delete
#   redirect '/authors'
# end
#
# post '/authors/:id' do
#   @author = Author.new(params)
#   @author.update
#   redirect '/authors'
# end
