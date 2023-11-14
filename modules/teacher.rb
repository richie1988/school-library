require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name: name, age: age)
    @specialization = specialization
  end

  def can_use_library?
    true
  end
end