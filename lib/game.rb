class Game
  attr_accessor :turn, :current_board

  def initialize
    @current_board = Board.new
    @turn = 0
  end

  def rules
    Rules.new(current_board)
  end

  def take_turn
    temporary_board = Board.new
    current_board.cells.each_with_index do |row, y|
      row.each_with_index do |_cell, x|
        puts "current state #{current_board.status(x, y)}"
        new_state = rules.new_state(x, y)
        puts "this new state should be  #{new_state}"
        temporary_board.update_status(x, y, new_state)
      end
    end
    self.turn += 1
    self.current_board = temporary_board
  end

  def seed
    temporary_board = Board.new
    current_board.cells.each_with_index do |row, y|
      row.each_with_index do |_cell, x|
        puts "current state #{current_board.status(x, y)}"
        new_state = initial_seed_state
        puts "this new state should be  #{new_state}"
        temporary_board.update_status(x, y, new_state)
      end
    end

    self.current_board = temporary_board
  end

  def initial_seed_state
    rand > 0.5 ? :live : :dead
  end
end

