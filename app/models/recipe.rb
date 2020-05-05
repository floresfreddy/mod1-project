class Recipe < ActiveRecord::Base
    belongs_to :drinks
    belongs_to :ingredients
    
end