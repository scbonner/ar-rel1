require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require "./models/user"


get '/' do
    @users = User.all
    erb :user_list
end

get '/new' do
    erb :user_form
end 

get '/delete' do
    erb :user_delete
end

post '/create' do
    user = User.new
    user.name = params{:name}
    user.email = params{:email}
    user.save
    "User created. id: #{user.id} name: #{user.name} email: #{user.email}"
end

post '/delete' do
    user = User.find_by(name: params[:name])
    if !user.nil?
      user.destroy
      "user #{params[:name]} deleted"
    else
      "user #{params[:name]} not found"
    end
end

