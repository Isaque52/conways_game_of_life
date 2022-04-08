class Game
  attr_reader :previous_board, :rules, :turn

  def initialize
    @previous_board = Board.new
    @rules = Rules.new(@previous_board)
    @turn = Turn.new
  end
end
