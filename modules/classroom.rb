class Classroom
  attr_accessor :label
  attr_reader :students

  # Initialize a new Classroom instance.
  # Set the label and initialize an empty array for students.
  def initialize(label)
    @label = label
    @students = []
  end

  # Add a student to the classroom.
  def add_student(student)
    @students << student
    student.classroom = self
  end
end
