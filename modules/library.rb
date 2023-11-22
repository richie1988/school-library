# library.rb
require 'json'

# The Library class represents the school library, which manages people, books, and rentals.

class Library
  attr_reader :people, :books, :rentals

  # Initializes a new library with empty arrays for people, books, and rentals.
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Lists all people in the library, indicating their category (Student or Teacher), ID, name, and age.
  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'All People:'
      @people.each do |person|
        category = person.instance_of?(Student) ? '[Student]' : '[Teacher]'
        puts "#{category} ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  # Adds a person to the library.
  def add_person(person)
    return if @people.any? { |existing_person| existing_person.id == person.id }

    @people << person
  end

  # Adds a book to the library.
  def add_book(book)
    return if @books.any? { |existing_book| existing_book.title == book.title }

    @books << book
  end

  # Adds a rental to the library.
  def add_rental(rental)
    @rentals << rental
  end

  # Converts people to an array of hashes.
  def people_to_hashes
    @people.map(&:to_h)
  end

  # Lists rentals for a specific person by ID.
  def list_rental_for_person(person_id)
    person = find_person_by_id(person_id)
    if person
      person_rentals = @rentals.select { |rental| rental.person == person }
      person_rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts "Person with ID #{person_id} not found."
    end
  end

  # Finds a person in the library by ID.
  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

  # Lists all books in the library, showing their title and author.
  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'All Books:'
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  # Finds a book in the library by title.
  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  # Loads data from files, including people, books, and rentals.
  def load_data_from_files
    load_people_from_file
    load_books_from_file
    load_rentals_from_file
  end

  # Saves data to files, including people, books, and rentals.
  def save_data_to_files
    save_people_to_file
    save_books_to_file
    save_rentals_to_file
  end


  private

  # Saves people to a file in JSON format.
  def save_people_to_file
    File.write('people.json', JSON.generate(@people.map(&:to_h)))
  end

  # Loads people from a JSON file.
  def load_people_from_file
    return unless File.exist?('people.json')

    people_data = JSON.parse(File.read('people.json'))
    people_data.each { |person_data| add_person(Person.from_h(person_data)) }
  end

  # Saves books to a file in JSON format.
  def save_books_to_file
    File.write('books.json', JSON.generate(@books.map(&:to_h)))
  end

  # Loads books from a JSON file.
  def load_books_from_file
    return unless File.exist?('books.json')

    books_data = JSON.parse(File.read('books.json'))
    books_data.each { |book_data| add_book(Book.from_h(book_data)) }
  end

  # Saves rentals to a file in JSON format.
  def save_rentals_to_file
    File.write('rentals.json', JSON.generate(@rentals.map(&:to_h)))
  end

  # Loads rentals from a JSON file.
  def load_rentals_from_file
    return unless File.exist?('rentals.json')

    rentals_data = JSON.parse(File.read('rentals.json'))

    # Load books and people first
    load_books_from_file
    load_people_from_file

    # Now associate rentals with books and people
    rentals_data.each do |rental_data|
      book_title = rental_data['book']['title']
      person_id = rental_data['person']['id']

      book = find_book_by_title(book_title)
      person = find_person_by_id(person_id)

      # Only add the rental if both book and person are found
      if book && person
        add_rental(Rental.from_h(rental_data, book, person))
      else
        puts "Failed to associate rental with book or person: #{rental_data}"
        puts "Book title: #{book_title}, Person ID: #{person_id}"
        puts "Found book: #{book.inspect}" if book
        puts "Found person: #{person.inspect}" if person
      end
    end
  end
end
