# main.rb

require_relative 'modules/app'

def display_menu
  puts 'Welcome to the school library app!'
  puts 'Choose an option by entering a number'
  puts '1 - All books'
  puts '2 - All person'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person\'s id'
  puts '7 - Exit'
end

def user_choices(choice, app)
  menu_options = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rental_for_person,
    7 => :exit # Corrected symbol
  }

  selected_method = menu_options[choice]

  if selected_method == :exit
    app.save_data_to_files # Save data before exiting
    puts 'Exiting the app. Goodbye!'
    exit
  elsif selected_method
    app.send(selected_method)
  else
    puts 'Invalid choice'
  end
end

def display_main
  app = App.new
  app.load_data_from_files # Load data at the start

  loop do
    display_menu
    user_choices(gets.chomp.to_i, app)
  end
end

display_main
