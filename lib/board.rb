class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(3) { Array.new(3) { :dead } }
  end

  def status(x, y)
    cells[y][x]
  end

  def neighbours(x, y)
    top_neighbours(x, y) + middle_neighbours(x, y) + bottom_neighbours(x, y)
  end

  private
  
  def top_neighbours(x, y)
    [
      [x - 1, y + 1],
      [x, y + 1],
      [x + 1, y + 1]
    ]
  end

  def middle_neighbours(x, y)
    [
      [x - 1, y],
      [x + 1, y]
    ]
  end

  def bottom_neighbours(x, y)
    [
      [x - 1, y - 1],
      [x, y - 1],
      [x + 1, y - 1]
    ]
  end
end
