class Nameable
  # This method raises NotImplementedError to ensure that subclasses
  # implementing this class are forced to provide their own implementation
  # for the correct_name method.
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
