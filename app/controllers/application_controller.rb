class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
 
  get '/bakeries' do
    "Hello World"
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goods = BakedGood.all.order(price: :desc)
    goods.to_json
  end


  get '/baked_goods/most_expensive' do 
    # goods = BakedGood.all.order(price: :desc).limit(1)
    goods = BakedGood.all.order(:price).reverse_order.limit(1)
    goods.to_json
  
  end





end
