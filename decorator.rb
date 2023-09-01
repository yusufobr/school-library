require './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize()
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
