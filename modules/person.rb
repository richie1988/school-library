# person.rb
require_relative '../decorator/nameable'
require_relative 'rental'

# The Person class represents an individual in the library, either a student or a teacher.
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # Initializes a new person with a random ID, name, age, and parent permission.
  def initialize(name, age, parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Returns the correct name of the person.
  def correct_name
    @name
  end

  # Checks if the person can use the library based on age and parent permission.
  def can_use_library?
    of_age? || @parent_permission
  end

  # Adds a rental to the person's rental history.
  def add_rental(rental)
    @rentals << rental
  end

  def of_age?
    @age >= 18
  end

  # Converts the person to a hash for serialization.
  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map(&:to_h)
    }
  end

  # Creates a new person instance from a hash.
  def self.from_h(data)
    person = new(data['name'], data['age'])
    person.instance_variable_set('@id', data['id'])
    person.instance_variable_set('@rentals', data['rentals'].map { |rental_data| Rental.from_h(rental_data) })
    person
  end
end
