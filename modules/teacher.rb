require_relative 'person'
# The Teacher class represents a teacher in the school library system, inheriting from the Person class.

class Teacher < Person
  attr_accessor :specialization

  # Initializes a new teacher with a name, age, and specialization.
  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  # Overrides the can_use_library? method to always return true for teachers.
  def can_use_library?
    true
  end

  # Public method to convert the teacher to a hash for serialization.
  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization,
      'rentals' => @rentals.map(&:to_h)
    }
  end
end
