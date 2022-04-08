class Game
  attr_reader :current_board
  attr_accessor :turn

  def initialize
    @current_board = Board.new
    @turn = 0
  end

  def rules
    Rules.new(current_board)
  end

  def take_turn
    puts "reading current board"
    p current_board
    puts "iterate over current board"
    current_board.cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        puts "this cell value is #{cell}-coords#{x} #{y}"
        puts "this cell-survival rule #{rules.survive?(x, y)}"
      end
    end
    self.turn += 1
    self.current_board = :TBD
  end
end

