require 'pry'

class Bank
  attr_accessor :id, :account, :owner

  def initialize(id, owner_name)
    @id = id
    @owner = Person.new(owner_name)
    @account = { type: 'unknown', details: [] }
  end

  def account_owner(person)
    if @owner && person.is_a?(Person)
      puts 'You may procced to you account'
      @owner << person
    else
      puts 'Owner not set'
    end
  end

  def account_details(detail)
    if @owner
      puts 'These is your account details'
      @account[:details] << detail
    else
      puts 'Invalid owner details'
    end
  end

  class Person
    attr_accessor :name

    def initialize(name)
      #   binding.pry
      @name = name
    end
  end
end

account11 = Bank.new(3_076_403, 'Michael brown')
puts account11.id
puts account11.owner.name
puts account11.account[:type]
