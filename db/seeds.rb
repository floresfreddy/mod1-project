require 'pry'
Drink.destroy_all

require 'httparty'
require 'json'


# response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")
# #binding.pry
# response["drinks"].each do |d|
# d1 = Drink.create(name: d["strDrink"], description: d["strInstructions"])
# end



