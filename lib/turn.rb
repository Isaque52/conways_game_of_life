class Turn
  attr_accessor :turn_number

  def initialize
    @turn_number = 0
  end

  def take_turn
    self.turn_number += 1
  end
end
