require 'pry'
require 'httparty'
require 'json'

Recipe.destroy_all
User.destroy_all
Favorite.destroy_all

# values to test for users 
u1 = User.create [name: "Angelo"]
u2 = User.create [name: "Hector"]
u3 = User.create [name: "Michael"]
u4 = User.create [name: "Jennifer"]
u5 = User.create [name: "Sarah"]

# API library is used to collect all recipes 
file = File.read('cocktails.json')
data_hash = JSON.parse(file)
data_hash.each do |r| r1 = Recipe.create(name: r["name"], taste: r["taste"], ingredients: r["ingredients"])
end

# creating favorite drinks with combine a user and and recipe
f1 = Favorite.create [recipe_id:100, user_id:6]
f2 = Favorite.create [recipe_id:105, user_id:8]
f3 = Favorite.create [recipe_id:111, user_id:7]
f4 = Favorite.create [recipe_id:106, user_id:9]
f5 = Favorite.create [recipe_id:102, user_id:10]
f6 = Favorite.create [recipe_id:101, user_id:6]








