class Rules
  attr_accessor :current_board

  def initialize(current_board)
    @current_board = current_board
  end

  #Any live cell with two or three live neighbours survives.
  def survive?(x, y)
    (live_neighbours(x, y) == 2 || live_neighbours(x, y) == 3) && current_board.live?(x, y)
  end

  private

  def live_neighbours(x, y)
    current_board.neighbours_statuses(x, y).count(:live)
  end
end