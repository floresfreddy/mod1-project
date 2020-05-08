
def view_user_favorites
  faves = $user.favorites.reload

  if faves.empty?
    puts
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    main_menu
  else
    puts
    puts "Here are your favorite drinks:"
    i = 1
    faves.each do |fave|
      puts "#{i}. #{fave.recipe.name}"
      puts "   Taste-#{fave.recipe.taste}"
      puts "   Ingredients- #{fave.recipe.ingredients} "
      puts
      i += 1
      sleep(0.2)
    end
    puts
    # puts "Returning to main menu..."
    puts "Enter any key to return to menu"
    choice = gets.chomp
    system 'clear'
    main_menu
  end

end