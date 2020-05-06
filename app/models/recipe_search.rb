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
    p ingredient
end

def create_recipe_array(ingredient)
#new_arr = []
Recipe.select {|k,v| recipe.include?(k)}
    #Recipe.all.select do |recipe|
        #r.ingredients.split(",").find do |i|
    #binding.pry
            #if i.strip == ingredient ||
            #i.strip == (ingredient + " ") ||
            #i.strip == (" " + ingredient)
            #new_arr << recipe
            #end
        #end
    end
#new_arr.uniq
end


