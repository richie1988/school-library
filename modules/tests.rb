require_relative 'person'
require_relative 'capitalizedeco'
require_relative 'trimmerdeco'

person = Person.new('Alice', 25)
puts "can the the person use the library #{person.can_use_library?}"
puts "How old is the person? is #{person.age}"

person = Person.new('richard', 35)
capitalized_person = Capitalized.new(person)
trimmed_person = Trimmer.new(person)

puts person.correct_name
puts capitalized_person.correct_name
puts trimmed_person.correct_name
