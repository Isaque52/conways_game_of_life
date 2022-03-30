class Turn
  attr_accessor :turn_number

  def initialize
    @turn_number = 0
  end

  def take_turn(current_board)
    puts "reading current board"
    p current_board
    puts "iterate over current board"
    current_board.cells.each do |row|
      row.each do |cell|
        puts "this cell value is #{cell}"
      end
    end
    self.turn_number += 1
  end
end
