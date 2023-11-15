require_relative 'basedecorator'

class Trimmer < Decorator
  def correct_name
    super[0, 10]
  end
end
