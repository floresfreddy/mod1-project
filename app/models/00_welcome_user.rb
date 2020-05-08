require 'tty-prompt'

def welcome
    system "clear" 
    puts art
    puts "Welcome to Drink"
end

def get_user_name
    puts "New User? (y/n)"
    choice = gets.chomp.downcase 
    if choice.start_with?("n")
    get_user_name_from_db
  elsif choice.start_with?("y")
    create_user_name
  else
    puts 
    puts "Please enter (y)es or (n)o:"
    get_user_name
  end 
end

  def get_user_name_from_db
    puts
    print "Please enter your username: "
    name = gets.chomp
    user = User.find_by(name: name)
    if user == nil
      user_equals_nil
    else
      puts
      puts "Welcome back, #{user.name}!"
      return user
    end
  end
  
  def validate_user_name(name)
    if User.find_by(name: name) != nil
      puts "User name already exists"
      print "Would you like to (u)se this name or (c)reate a new user name? "
      choice = gets.chomp
      if choice.start_with?("u")
        print "Welcome back, #{name}!"
        return User.find_by(name: name)
      elsif choice.start_with?("c")
        create_user_name
      else
        puts "Invalid option/choice"
        get_user_name
      end
    end
  end
  
  def create_user_name
    puts
    print "Create username: "
    name = gets.chomp
    validate_user_name(name)
    puts
    puts "Welcome to Drink, #{name}!"
    User.create(name: name)
  end

  def user_equals_nil
    puts
    puts "We can't find that user!"
    puts "Would you like to:"
    puts "1. search again"
    puts "2. create new user"
    choice = gets.chomp
    if choice == "1"
      get_user_name_from_db
    elsif choice == "2"
      create_user_name
    else
      puts
      puts "Please select either 1 or 2"
      user_equals_nil
    end
    
  end


# MAKING THE MENU 


  def main_menu
    puts
    puts "MAIN MENU"
    puts "0. exit"
    puts "1. search for a drink by ingredient"
    puts "2. search for a drink by taste"
    puts "3. view your favorite drinks"
    puts "4. delete a drink from your favorites"
    puts "5. create a new drink"
    puts
    puts "MUSIC"
    puts "6. stop music"
    puts "7. play music"
    puts
    puts "select(0..7)"
    choice = gets.chomp
    menu_selection(choice)
  end
  
  def menu_selection(choice)
    case choice
    when "0", "exit"
      kill_music
      puts
      puts "Goodbye #{$user.name}! Drink Responsibly!"
    when "1", "search"
      # search for a recipe by ingredient
      recipe_search
    when "2"
      search_by_taste
    when "3"
      # view user's favorite recipes
      view_user_favorites
    when "4"
      get_recipe_to_delete
    
    when "5"
      create_recipe
    when "6"
      kill_music
      system 'clear'
      main_menu
    when "7"
      play_music
      system 'clear'
      main_menu
    else
      system 'clear'
      puts
      puts "Invalid input!"
      main_menu
    end
  end
