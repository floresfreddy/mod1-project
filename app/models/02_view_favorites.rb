# def view_user_favorites
#   faves = $user.favorites.reload

#   if faves.empty?
#     puts
#     puts "You don't have any favorites saved yet!"
#     puts "Returning to main menu..."
#     main_menu
#   else
#     puts
#     puts "Here are your favorite recipes:"
#     i = 1
#     faves.each do |fave|
#       d_id = fave.recipe.id
#       puts "#{i}. #{Recipe.where(id = d_id)}"
#       i += 1
#       sleep(0.5)
#     end
#     puts
#     puts "Returning to main menu..."
#     main_menu
#   end

#   main_menu

# end

def view_user_favorites
  faves = $user.favorites.reload

  if faves.empty?
    puts
    puts "You don't have any favorites saved yet!"
    puts "Returning to main menu..."
    main_menu
  else
    puts
    puts "Here are your favorite recipes:"
    i = 1
    faves.each do |fave|
      puts "#{i}. #{fave.recipe.name}"
      i += 1
      sleep(0.2)
    end
    puts
    puts "Returning to main menu..."
    main_menu
  end

end