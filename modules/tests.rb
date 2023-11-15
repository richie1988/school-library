# modules/tests.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# Create a classroom
classroom = Classroom.new('Math Class')

# Create students
student1 = Student.new('Alice', 17, parent_permission: true, classroom: classroom)
student2 = Student.new('Bob', 18, parent_permission: true, classroom: classroom)

# Create a teacher
teacher = Teacher.new('Mr. Smith', 30, 'Mathematics')

# Create a book
book = Books.new('Ruby Programming', 'John Doe')

# Create rentals
Rental.new('2023-11-15', book, student1)
Rental.new('2023-11-16', book, student2)
Rental.new('2023-11-17', book, teacher)

# Display information
puts "Classroom: #{classroom.label}"
puts "Students in the classroom: #{classroom.students.map(&:name).join(', ')}"

puts "\nTeacher: #{teacher.name}, Specialization: #{teacher.specialization}"
puts "Teacher can use library: #{teacher.can_use_library?}"

puts "\nBook: #{book.title} by #{book.author}"
puts 'Rentals for the book:'
book.rentals.each do |rental|
  puts "#{rental.person.name} rented on #{rental.date}"
end

puts "\nStudent Rentals:"
student1.rentals.each do |rental|
  puts "#{rental.book.title} rented on #{rental.date}"
end
