require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order.rb')
also_reload('./models/*')

#index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
erb(:index)
end

#new
get '/pizza-orders/new' do
erb(:new)
end

#delete/destroy
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  redirect '/pizza-orders'
end

#show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

#create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#edit
get '/pizza-orders/:id/edit' do
@order = PizzaOrder.find(params[:id].to_i)
erb(:edit)
end

#update
post '/pizza-orders/:id' do
 @order = PizzaOrder.new(params)
 @order.update()
 erb(:update)
end
