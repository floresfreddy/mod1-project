def create_recipe
    dname = ""
    dtaste = ""
    ding = ""
    puts
    puts "What is the drink called?"
    dname = gets.chomp
    puts
    puts "What does it taste like?"
    dtaste = gets.chomp
    puts 
    puts "What are its ingredients? (ex.'Whiskey, lemon juice, soda water')"
    puts 
    ding = gets.chomp
    r1 = Recipe.create(name: dname, taste: dtaste, ingredients: ding)
    puts
    puts "New Drink Created! Add to Favorites? (y/n)"
    puts
    choice = gets.chomp.downcase
    if choice.start_with?("y")
        $user.add_favorite(r1)
        puts
        system 'clear'
        puts "Drink added to favorites!"
        puts 
        main_menu
    else
        main_menu
    end



end