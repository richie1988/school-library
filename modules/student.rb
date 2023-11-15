# student.rb
require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_students(self)
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
