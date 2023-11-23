require 'rspec'
require_relative '../modules/student'
require_relative '../modules/classroom'

describe Student do
  context 'when initialized' do
    it 'should create a student object' do
      student = Student.new('Mary Sue', 18, classroom: 'A111')
      expect(student).to be_a(Student)
      expect(student.classroom).to eq('A111')
    end
  end

  context 'when playing hooky' do
    it 'should return ¯\(ツ)/¯' do
      student = Student.new('Mary Sue', 18, classroom: 'A111')
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  context 'Testing add_classroom method' do
    it 'should set the classroom' do
      student = Student.new('Mary Sue', 18)
      classroom = Classroom.new('A111')
      student.add_classroom(classroom)
      expect(student.classroom).to eq(classroom)
    end
  end
end
