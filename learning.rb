# require 'pry'

# class Bank
#   attr_accessor :id, :account, :owner

#   def initialize(id, owner_name)
#     @id = id
#     @owner = Person.new(owner_name)
#     @account = { type: 'unknown', details: [] }
#   end

#   def account_owner(person)
#     if @owner && person.is_a?(Person)
#       puts 'You may procced to you account'
#       @owner << person
#     else
#       puts 'Owner not set'
#     end
#   end

#   def account_details(detail)
#     if @owner
#       puts 'These is your account details'
#       @account[:details] << detail
#     else
#       puts 'Invalid owner details'
#     end
#   end

#   class Person
#     attr_accessor :name

#     def initialize(name)
#       #   binding.pry
#       @name = name
#     end
#   end
# end

# account11 = Bank.new(3_076_403, 'Michael brown')
# puts account11.id
# puts account11.owner.name
# puts account11.account[:type]

secret_word = 'jamesbond'
guess = ''
guess_count = 0
guess_limit = 3
out_of_guesses = false

while guess != secret_word and !out_of_guesses
  if guess_count < guess_limit
    puts 'Enter guess!'
    guess = gets.chomp
    guess_count += 1
  else
    out_of_guesses = true
    puts 'you have run out of guesses'
  end

end

if out_of_guesses
  puts 'you lose'
else
  puts 'you have won the game'
end
