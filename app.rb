require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/user'
require './models/team'

# get '/' do
#     User.all.to_yaml + Team.all.to_yaml
# end

get '/' do
    @users = User.all
    erb :user_list
end

get '/new' do
    erb :user_form
end 

get '/remove' do
    erb :user_delete
end

# post '/show_user' do
#     @user = User.find_by(name: params[:name])
#     if @user.nil?
#         return "User not found"
#     end 
#     erb :user
# end 

# get '/user/:id' do
#     @user = User.find(params[:id])
#     if @user.nil?
#       return "User not found"
#     end
#     erb :user
# end 



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

