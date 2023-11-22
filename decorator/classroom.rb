class Classroom
  attr_accessor :label, :students

  # Initializes a new classroom with a label and an empty array of students.
  def initialize(label)
    @label = label
    @students = []
  end

  # Adds a student to the classroom's list of students and sets the student's classroom attribute.
  def add_students(student)
    @students << student
    student.classroom = self
  end
end
