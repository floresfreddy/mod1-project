
require 'pry'
require 'httparty'
require 'json'

Recipe.destroy_all
User.destroy_all
Favorite.destroy_all

# values to test for users 
u1 = User.create(name: "freddy")
u2 = User.create(name: "Hector")
u3 = User.create(name: "Michael")
u4 = User.create(name: "Jennifer")
u5 = User.create(name: "Sarah")


# values to test for recipies

r1 = Recipe.create(name:"whiskey", taste:"fire")
r2 = Recipe.create(name:"lemon", taste:"sour")
r3 = Recipe.create(name:"daquiri", taste:"sweet")
r4 = Recipe.create(name:"long island", taste:"sweet")


# API library is used to collect all recipes 
# file = File.read('cocktails.json')
# data_hash = JSON.parse(file)
# data_hash.each do |r| r1 = Recipe.create(name: r["name"], taste: r["taste"], ingredients: r["ingredients"])
# end


file = File.read('cocktails.json')
data_hash = JSON.parse(file)
data_hash.each do |r| 
    ing = r["ingredients"].map{|i| i["ingredient"]}.join("  ")
    Recipe.create(name: r["name"], taste: r["taste"], ingredients: ing )
end

# creating favorite drinks with combine a user and and recipe for test

Favorite.create(recipe_id:r1.id, user_id:u1.id)
Favorite.create(recipe_id:r2.id, user_id:u1.id)
Favorite.create(recipe_id:r3.id, user_id:u1.id)
Favorite.create(recipe_id:r4.id, user_id:u1.id)










