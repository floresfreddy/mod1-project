require 'pry'

Drink.destroy_all

require 'httparty'
require 'json'


# response = HTTParty.get("cocktails.json")
 # binding.pry
# response[" "].each do |d|
 #d1 = Drink.create(name: d["name"], taste: d["taste"])
 # end

#$cocktails.each do |d|  d1 = Drink.create(name: d["name"], taste: d["taste"]) 
#

file = File.read('cocktails.json')
data_hash = JSON.parse(file)

data_hash.each do |d| d1 = Drink.create(name: d["name"], description: d["taste"]) 
end

data_hash.each do |r| r1= Recipe.create(name: d["name"], ])









