require_relative 'basedecorator'

class Capitalized < Decorator
  def correct_name
    super.capitalize
  end
end
