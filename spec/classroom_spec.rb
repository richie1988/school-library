require 'rspec'
require_relative '../decorator/classroom'
require_relative '../modules/student'

describe Classroom do
  context 'when initialized' do
    it 'creates a classroom object with the specified label' do
      classroom = Classroom.new('A111')
      expect(classroom).to be_a(Classroom)
      expect(classroom.label).to eq('A111')
      expect(classroom.students).to be_empty
    end
  end

  context 'when adding a student' do
    it 'adds a student to the classroom and sets the student\'s classroom attribute' do
      classroom = Classroom.new('A111')
      student = Student.new('John Doe', 17)
      classroom.add_students(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
