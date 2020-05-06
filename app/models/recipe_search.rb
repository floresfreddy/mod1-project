require 'pry'
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
    prompt = TTY::Prompt.new
    ingredient = prompt.ask "Welcome, please enter the name of an ingredient:"
    ingredient.downcase
end

def create_recipe_array(ingredient)
    new_arr = []
    Recipe.all.select do |recipe|
        recipe.ingredients.all.select do |k,v|
            if k == ingredient
                new_arr << v
            end 
        end
    end
    return new_arr
  end


