require 'active_record'
require './models/user'
require './models/team'
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")

Team.destroy_all
User.destroy_all

team = Team.new
team.name = "Tigers"
team.notes = "code in Ruby"
team.save

team = Team.new
team.name = "Jets"
team.notes = "code in React and JavaScript"
team.save

user = User.new
user.name = "Fred"
user.email = "fred@sample.com"
user.team = Team.find_by(name: "Jets")
user.save

user = User.new
user.name = "Jim"
user.email = "jim@sample.com"
user.team = Team.find_by(name: "Jets")
user.save

user = User.new
user.name = "Alice"
user.email = "alice@sample.com"
user.team = Team.find_by(name: "Jets")
user.save

user = User.new
user.name = "Holly"
user.email = "holly@sample.com"
user.team = Team.find_by(name: "Tigers")
user.save

user = User.new
user.name = "Jane"
user.email = "jane@sample.com"
user.team = Team.find_by(name: "Tigers")
user.save

user = User.new
user.name = "Aaron"
user.email = "aaron@sample.com"
user.team = Team.find_by(name: "Tigers")
user.save

user = User.new
user.name = "Felix"
user.email = "felix@sample.com"
user.team = Team.find_by(name: "Tigers")
user.save

puts
puts 'The users are:'
ua = User.all
ua.each do |u|
  puts u.name + '|' + u.email + '|' + u.team.name
end

puts
puts 'The teams are:'
ta = Team.all
ta.each do |t|
  puts t.name + '|' + t.notes
  t.users.each do |u|
    puts u.name
  end
end
