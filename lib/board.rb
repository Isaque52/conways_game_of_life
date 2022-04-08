class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(height) { Array.new(width) { :dead } }
  end

  def status(x, y)
    cells[y][x]
  end

  def live?(x, y)
    status(x, y) == :live
  end

  def dead?(x, y)
    status(x, y) == :dead
  end

  def neighbours_statuses(x, y)
    neighbours(x, y).map { |xx, yy| status(xx, yy) }
  end

  private

  def neighbours(x, y)
    top_neighbours(x, y) + middle_neighbours(x, y) + bottom_neighbours(x, y)
  end

  def top_neighbours(x, y)
    [
      [x - 1, y + 1],
      [x, y + 1],
      [x + 1, y + 1]
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= height || cell[0] >= width }
  end

  def middle_neighbours(x, y)
    [
      [x - 1, y],
      [x + 1, y]
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= height || cell[0] >= width }
  end

  def bottom_neighbours(x, y)
    [
      [x - 1, y - 1],
      [x, y - 1],
      [x + 1, y - 1]
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= height || cell[0] >= width }
  end

  def width
    3
  end

  def height
    3
  end
end
