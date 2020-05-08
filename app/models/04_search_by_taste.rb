def search_by_taste
    user_taste = get_taste_from_user
    taste_array = create_taste_array(user_taste) 
    taste_limit = get_taste_limit(taste_array, user_taste)
    selected_taste = view_taste(taste_array, taste_limit)
    tm = taste_menu
    taste_menu_selection(tm,selected_taste)
    main_menu
    
  end
  
  def get_taste_from_user
    puts
    puts "Please enter a taste:"
    user_taste = gets.chomp.downcase
  end
  
  def create_taste_array(user_taste)
    arr = []
    arr = Recipe.all.select do |r|
        r.taste.downcase.include?(user_taste)
        end
    return arr.uniq
  end

  def get_taste_limit(taste_array, taste)
    puts
    if taste_array.empty?
      puts "Sorry, there are no Drinks available according your taste"
      puts "Let's try again..."
      search_by_taste
    end
                      
    puts <<~TEXT
    There are #{taste_array.length} drink corresponding to your taste.
    TEXT
    choice = taste_array.length
  
    if choice > taste_array.length
      puts
      puts "Oops! There are only #{taste_array.length} recipes!"
      choice = taste_array.length
    else
      choice
    end
  end
  
  def view_taste(taste_array, taste_limit)
    puts
    puts "Here you go!"
    taste_array[0...taste_limit.to_i].each_with_index do |t, i|
     puts
    puts "#{i+1}. #{t.name}"
     puts "#{t.taste}"
    end
  end
  
  def taste_menu
   puts
    puts "Please choose one:"
    puts "0. Return to main menu"
    puts "1. Save the Drink to favorites"
    puts
    choice = gets.chomp
  end
  
  def taste_menu_selection(choice, selected_taste=nil)
    case choice
    when "0"
    # return to main menu
      false
    when "1", "save"
    # save a recipe to favorites
     save_to_favorites(selected_taste)
     true
    else
      puts "Invalid choice!"
      true
    end
  end
  
  def in_user_favorites?(recipe)
    # checks user's favorites to make sure it hasn't been added yet
    $user.favorites.each do |f|
      if f.recipe_id == recipe.id
         return true
      end
    end
    false
  end
  
  def save_to_favorites(selected_taste)
    isrunning = true
    while isrunning
      puts
      puts "Which Drink would you like to save? Type the number (q to quit):"
      choice = gets.chomp
      if choice.start_with?("q")
        break
      end
      recipe = selected_taste[choice.to_i - 1]
  
      if in_user_favorites?(recipe)
        puts
        puts "You've already added this Drink to your favorites!"
        next
        else
        puts
        puts "Save #{recipe.name}? (y/n)"
        choice = gets.chomp
        case choice
         when "y", "yes"
          $user.add_favorite(recipe)
          puts
          puts "Drink added to your favorites!"
        when "n", "no"
          puts "Returning to main menu..."
          isrunning = false
        else
          puts "Invalid input!"
      end
      end
    end
  
end

  

  