# library.rb
class Library
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

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

  def add_person(person)
    @people << person
  end

  def add_book(book)
    @books << book
  end

  def add_rental(rental)
    @rentals << rental
  end

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

  def find_person_by_id(person_id)
    @people.find { |person| person.id == person_id }
  end

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

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end
end
