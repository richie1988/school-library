# app.rb
require_relative '../decorator/classroom'
require_relative 'library'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# The App class represents the main application for the school library
class App
  # Initializes the App with a new Library instance.
  def initialize
    @library = Library.new
  end

  # Displays a list of all books in the library.
  def list_all_books
    puts 'All Books'
    @library.list_all_books
  end

  # Displays a list of all people (students and teachers) in the library.
  def list_all_people
    puts 'All People'
    @library.list_all_people
  end

  # Guides the user to create either a student or a teacher based on their choice.
  def create_person
    puts 'Do you want to create the student(1) or teacher(2)? [input the number]:'
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice'
    end
  end

  # Prompts the user to enter information to create a new student and adds it to the library.
  def create_student
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp.to_i
    puts 'Does the student have parent permission? (Y/N):'
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(name, age, parent_permission: parent_permission)
    @library.add_person(student)
    puts 'Student created successfully.'
  end

  # Prompts the user to enter information to create a new teacher and adds it to the library..
  def create_teacher
    puts 'Enter teacher name:'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp.to_i
    puts 'Enter teacher specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @library.add_person(teacher)
    puts 'Teacher created successfully.'
  end

  # Prompts the user to enter information to create a new book and adds it to the library.
  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @library.add_book(book)
    puts 'Book created successfully.'
  end

  # Guides the user to create a new rental by selecting a book and associating it with a person.
  def create_rental
    if @library.books.empty?
      puts 'No books available. Cannot create a rental.'
      return
    end
    puts 'Select a book from the following list by number:'
    @library.books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    selected_book_index = gets.chomp.to_i

    if selected_book_index >= 0 && selected_book_index < @library.books.length
      selected_book = @library.books[selected_book_index]

      puts 'Enter rental date (YYYY-MM-DD):'
      date = gets.chomp

      @library.list_all_people
      puts 'Enter person ID for rental:'
      person_id = gets.chomp.to_i
      person = @library.find_person_by_id(person_id)

      if person
        rental = Rental.new(date, selected_book, person)
        @library.add_rental(rental)
        puts 'Rental created successfully.'
      else
        puts "Person with ID #{person_id} not found."
      end
    else
      puts 'Invalid book selection.'
    end
  end

  # Lists all rentals associated with a person based on their ID.
  def list_rental_for_person
    puts 'Enter person ID'
    person_id = gets.chomp.to_i
    puts "Rental for person ID #{person_id}:"
    @library.list_rental_for_person(person_id)
  end

  # Loads data from external files into the library.
  def load_data_from_files
    @library.load_data_from_files
  end

  # Saves library data to external files.
  def save_data_to_files
    @library.save_data_to_files
  end
end
