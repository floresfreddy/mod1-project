class Recipe < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites


    def recipe_search
        ingredient = get_ingredient_from_user
        recipe_array = create_recipe_array(ingredient)
        limit = get_recipe_limit(recipe_array, ingredient)
        selected_recipes = view_recipes(recipe_array, limit)
        rms = recipe_menu
        recipe_menu_selection(rms, selected_recipes)
        main_menu
      end
    
      def get_ingredient_from_user
        puts
        puts "Welcome, please enter the name of an ingredient:"
        ingredient = gets.chomp.downcase
      end
    
      def create_recipe_array(ingredient)
        new_arr = []
        Recipe.all.select do |r|
          r.ingredients.split(",").find do |i|
            if i.strip == ingredient ||
              i.strip == (ingredient + " ") ||
              i.strip == (" " + ingredient)
              arr << recipe
            end
          end
        end
        return arr.uniq
      end
    
end