# The Rental class represents a book rental transaction between a person and a book in the library.
class Rental
  attr_accessor :date
  attr_reader :person, :book

  # Initializes a new rental with a date, associated book, and associated person.
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Ensure the rental is associated with the book
    book&.add_rental(self)

    # Ensure the rental is associated with the person
    person&.add_rental(self)
  end

  # Converts the rental to a hash for serialization.
 

  # Creates a new rental instance from a hash with optional book and person associations.
  def self.from_h(data, book = nil, person = nil)
    new(data['date'], book, person)
  end
end
