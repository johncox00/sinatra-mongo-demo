require 'sinatra'
require './thing.rb'


configure do
   Mongoid.configure do |config|
    name = "demo"
    host = "localhost"
    config.connect_to("davinci")
   end
    
 end

get '/' do
  erb :form
end

post '/' do
  thing = Thing.new
  thing.name = params[:name]
  thing.thing_id = params[:thing_id]
  for i in 1..4
	  thing[params["key_#{i}"]] = params["value_#{i}"]
  end
  thing.save!
  thing.to_json
end

get '/search' do
  Thing.where(params).to_json
end

get '/:name' do
  "Hello, #{params[:name]}!"
end

