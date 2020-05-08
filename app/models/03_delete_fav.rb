def get_recipe_to_delete
    favorites = $user.favorites
    fav_to_delete = display_faves(favorites)
    if fav_to_delete == 0
        main_menu
    else
        system 'clear'
        puts
        puts "Drink Deleted!"
        $user.delete_favorite(fav_to_delete)
        sleep(0.2)
        main_menu
    end
  end
  
  def display_faves(favorites)
    puts
    puts "Here are all your favorites:"
    favorites.each_with_index do |fave, i|
      recipe = Recipe.find(fave.recipe_id)
      puts "#{i+1}. #{recipe.name}"
    end
    puts
    print "Which drink would you like to remove from favorites? "
    rec_num = gets.chomp.to_i
    if rec_num > $user.favorites.length
        puts "Invalid Choice"
    else
        puts
        recipe = Recipe.find(favorites[rec_num-1].recipe_id)
        print "Confirm deletion of #{recipe.name}? (y/n) "
        yn = gets.chomp.downcase
        if yn.start_with?("y")
            recipe
        else
            return 0
        end
    end
  end