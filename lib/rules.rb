class Rules
  attr_accessor :current_board

  def initialize(current_board)
    @current_board = current_board
  end

  def new_state(x, y)
    return :live if survive?(x, y)

    :dead
  end

  private

  #Any live cell with two or three live neighbours survives.
  def survive?(x, y)
    (live_neighbours(x, y) == 2 || live_neighbours(x, y) == 3) && current_board.live?(x, y)
  end

  def live_neighbours(x, y)
    current_board.neighbours_statuses(x, y).count(:live)
  end
end
