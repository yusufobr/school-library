require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super.strip[0...10]
  end
end
