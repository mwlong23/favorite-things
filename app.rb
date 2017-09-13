require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('pry')

get('/') do
  @list = Item.all
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["ranking"].to_i
  item = Item.new(name, rank)
  item.save
  @list = Item.all
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
