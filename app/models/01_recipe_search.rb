require 'pry'


def recipe_search
    ingredient = get_ingredient_from_user
    recipe_array = create_recipe_array(ingredient)
    limit = get_recipe_limit(recipe_array, ingredient)
    selected_recipes = view_recipes(recipe_array, limit)
    rms = recipe_menu
    recipe_menu_selection(rms, selected_recipes)
    main_menu
<<<<<<< HEAD
end

def get_ingredient_from_user
    #prompt = TTY::Prompt.new
    #ingredient = prompt.ask "Welcome, please enter the name of an ingredient:"
    #ingredient.downcase
    puts "Please enter an ingredient:"
  ingredient = gets.chomp.downcase

end

def create_recipe_array(ingredient)
   
end

def create_recipe_array(ingredient)
        arr = []
        Recipe.all.each do |r|
        if r.ingredients == ingredient
        arr << r
        end
        arr
    end
end
        #Recipe.all.select do |recipe|
         # recipe.ingredients.split(",").find do |ing|
          #  if ing.strip == ingredient ||
           #   ing.strip == (ingredient + " ") ||
            #  ing.strip == (" " + ingredient)
             # arr << recipe
            #end
          #end
        #end
        #return arr.uniq
    #arr = []
    #Recipe.all.select do |recipe|
     # recipe.ingredients.find_each do |ing|
      #  if ing == ingredient
       #   arr << recipe
        #end
      #end
    #end
    #return arr.uniq
  #end

=======
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
  
>>>>>>> master
  def get_recipe_limit(recipe_array, ingredient)
    puts
    if recipe_array.empty?
      puts "Sorry, there are no drinks with #{ingredient}!"
      puts "Let's try again..."
      recipe_search
    end
<<<<<<< HEAD
<<<<<<< HEAD
    puts <<~TEXT
    There are #{recipe_array.length} recipes that include #{ingredient}.
    How many would you like to view?
    TEXT
    choice = gets.chomp.to_i
=======
    # puts <<~TEXT
    # There are #{recipe_array.length} recipes that include #{ingredient}.
    # How many would you like to view?
    # TEXT
    # choice = gets.chomp.to_i
=======
    
>>>>>>> master
    puts <<~TEXT
    There are #{recipe_array.length} drinks that include #{ingredient}.
    TEXT
    choice = recipe_array.length
>>>>>>> master
  
    if choice > recipe_array.length
      puts
      puts "Oops! There are only #{recipe_array.length} drinks!"
      choice = recipe_array.length
    else
      choice
    end
  end
  
<<<<<<< HEAD

  
def view_recipes(recipe_array, limit)
=======
  def view_recipes(recipe_array, limit)
>>>>>>> master
    puts
    puts "Here you go!"
    recipe_array[0...limit.to_i].each_with_index do |recipe, i|
      puts
      puts "#{i+1}. #{recipe.name}"
      puts "#{recipe.ingredients}"
<<<<<<< HEAD
      sleep(0.5)
    end
end
  
def recipe_menu
=======
      sleep(0.2)
    end
  end
  
  def recipe_menu
>>>>>>> master
    puts
    puts "Please choose one:"
    puts "0. Return to main menu"
    puts "1. Save a drink to favorites"
    choice = gets.chomp
<<<<<<< HEAD
end
  
def recipe_menu_selection(choice, selected_recipes=nil)
=======
  end
  
  def recipe_menu_selection(choice, selected_recipes=nil)
>>>>>>> master
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
<<<<<<< HEAD
end
  
def in_user_favorites?(recipe)
    # checks user's favorites to make sure it hasn't been added yet
    $username.favorites.each do |fav|
=======
  end
  
  def in_user_favorites?(recipe)
    # checks user's favorites to make sure it hasn't been added yet
    $user.favorites.each do |fav|
>>>>>>> master
      if fav.recipe_id == recipe.id
        return true
      end
    end
    false
<<<<<<< HEAD
end
  
def save_to_favorites(selected_recipes)
=======
  end
  
  def save_to_favorites(selected_recipes)
>>>>>>> master
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
<<<<<<< HEAD
          $username.add_favorite(recipe)
=======
          $user.add_favorite(recipe)
>>>>>>> master
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
  
<<<<<<< HEAD
end


=======
  end
>>>>>>> master

