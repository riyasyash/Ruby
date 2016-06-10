require 'sinatra'
require 'slim'
require 'sinatra/activerecord'
require './config/environments'
require './models/model'
require './models/todo_item'


set :method_override, true #For better working of /delete/:id or simply matching urls with multiple /'s'
get '/models' do
  @model = Model.all
  erb :model
end
get '/:id' do

  @model = Model.find(params[:id])
    
  erb :item_show, :layout=> :layout
end
post '/submit' do
  @model = Model.new(params[:model])
  if @model.save
    redirect '/'
  else
    "Error"
  end
end
get '/styles.css' do 
  scss :styles
end
post '/submit/:id' do
  @todo_item = TodoItem.new(params[:todo_item])
  @todo_item.save
  redirect '/'
end

get '/' do
  @models = Model.all
  erb :model
end
get '/delete/:id' do
  @item = TodoItem.find(params[:id])
  @item.destroy
  redirect '/'

end
get '/model/:id' do
  @model = Model.find(params[:id])
  @items = TodoItem.where(model_id: @model.id)
  @items.each do |item|
    item.destroy
  end
  @model.destroy
  "Success"
  redirect '/'
end


__END__
