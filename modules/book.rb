# book.rb
# The Book class represents a book in the school library.
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  # Initializes a new book with a title, author, and an empty array of rentals.
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Adds a rental to the book's list of rentals.
  def add_rental(rental)
    @rentals << rental
  end

  # Converts the book data to a hash for saving to external files.
  def to_h
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map(&:to_h)
    }
  end

  # Creates a new Book instance from a hash of data, including rentals.
  def self.from_h(data)
    book = new(data['title'], data['author'])
    book.instance_variable_set('@rentals', data['rentals'].map { |rental_data| Rental.from_h(rental_data) })
    book
  end
end
