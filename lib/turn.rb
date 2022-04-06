class Turn
  attr_accessor :turn_number

  def initialize
    @turn_number = 0
  end

  def take_turn(current_board)
    puts "reading current board"
    p current_board
    puts "iterate over current board"
    current_board.cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        puts "this cell value is #{cell}-coords#{x} #{y}"
        puts "this cell-survival rule #{rules(current_board).survive?(x, y)}"
      end
    end
    self.turn_number += 1
  end

  private

  def rules(current_board)
    @rules ||= Rules.new(current_board)
  end
end
