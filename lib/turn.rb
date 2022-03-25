class Turn
  attr_accessor :turn_number

  def initialize
    @turn_number = 0
  end

  def take_turn
    puts "reading current board"
    puts "current board read establishing what to do"
    puts "iterate over current board"
    self.turn_number += 1
  end
end
