require 'rspec'
require_relative '../modules/classroom'
require_relative '../modules/student'

describe Classroom do
  context 'when initialized' do
    it 'has a label' do
      classroom = Classroom.new('A111')
      expect(classroom.label).to eq('A111')
    end
  end

  context 'when adding students' do
    it 'includes students in the list of students' do
      classroom = Classroom.new('A111')
      student = Student.new('A111', 'Mary Sue')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
