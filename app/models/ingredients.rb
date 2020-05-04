class Ingredients < ActiveRecord::Base
    has_many :recipies
    has_many :drinks, through: :recipies 
   
end