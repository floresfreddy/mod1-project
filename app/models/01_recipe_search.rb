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
    puts
    puts "Please enter an ingredient:"
    ingredient = gets.chomp.downcase
end
  
def create_recipe_array(ingredient)
    arr = []
    arr = Recipe.all.select do |r|
        r.ingredients.downcase.include?(ingredient)
        end
    return arr.uniq
end
  
def get_recipe_limit(recipe_array, ingredient)
    puts
    if recipe_array.empty?
      puts "Sorry, there are no drinks with #{ingredient}!"
      puts "Let's try again..."
      recipe_search
    end
    puts <<~TEXT
    There are #{recipe_array.length} recipes that include #{ingredient}.
    How many would you like to view?
    TEXT
    choice = gets.chomp.to_i
    puts <<~TEXT
    There are #{recipe_array.length} drinks that include #{ingredient}.
    TEXT
    choice = recipe_array.length
  
    if choice > recipe_array.length
      puts
      puts "Oops! There are only #{recipe_array.length} drinks!"
      choice = recipe_array.length
    else
      choice
    end
end
  
def view_recipes(recipe_array, limit)
    puts
    puts "Here you go!"
    recipe_array[0...limit.to_i].each_with_index do |recipe, i|
      puts
      puts "#{i+1}. #{recipe.name}"
      puts "#{recipe.ingredients}"
      sleep(0.2)
    end
end
  
def recipe_menu
    puts
    puts "Please choose one:"
    puts "0. Return to main menu"
    puts "1. Save a drink to favorites"
    choice = gets.chomp
end
  
def recipe_menu_selection(choice, selected_recipes=nil)
    case choice
    when "0"
      # return to main menu
      false
    when "1", "save"
      # save a recipe to favorites
      save_to_favorites(selected_recipes)
      true
    else
        system 'clear'
      puts
      puts "Invalid choice!"
      true
    end
end
  
def in_user_favorites?(recipe)
    # checks user's favorites to make sure it hasn't been added yet
    $user.favorites.each do |fav|
      if fav.recipe_id == recipe.id
        return true
      end
    end
    false
end
  
def save_to_favorites(selected_recipes)
    isrunning = true
    while isrunning
      puts
      puts "Which drink would you like to save? Type the number (q to quit):"
      choice = gets.chomp
      if choice.start_with?("q")
        break
      end
      recipe = selected_recipes[choice.to_i - 1]
  
      if in_user_favorites?(recipe)
        puts
        puts "You've already added this drink to your favorites!"
        next
      else
        puts
        puts "Save #{recipe.name}? (y/n)"
        choice = gets.chomp
        case choice
        when "y", "yes"
          $user.add_favorite(recipe)
          puts
          puts "#{recipe.name} added to your favorites!"
        when "n", "no"
          puts "Returning to main menu..."
          isrunning = false
        else
            system 'clear'
          puts "Invalid input!"

        end
      end
    end
  
end

