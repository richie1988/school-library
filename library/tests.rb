require_relative 'person'

person = Person.new(name: 'Alice', age: 25)
puts "Person ID: #{person.id}"
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"
puts "Can use the librbary? (Expect true): #{person.can_use_library?}"
