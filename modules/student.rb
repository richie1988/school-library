# student.rb
require_relative 'person'
# The Student class represents a student in the school library system, inheriting from the Person class
class Student < Person
  attr_accessor :classroom

  # Initializes a new student with a name, age, optional parent permission, and optional classroom.

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  # Adds the student to a classroom, updating the classroom and student associations.
  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # Returns a playful message indicating playing hooky.
  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom&.id,
      'rentals' => @rentals.map(&:to_h)
    }
  end
end
