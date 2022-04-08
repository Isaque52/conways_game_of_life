class Board
  attr_accessor :cells
  attr_reader :desired_width, :desired_height

  def initialize(desired_height = default_height, desired_width = default_width)
    @desired_height = desired_height
    @desired_width = desired_width
    @cells = Array.new(desired_height) { Array.new(desired_width) { :dead } }
  end

  def update_status(x, y, new_state)
    cells[y][x] = new_state
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

  def default_width
    3
  end

  def default_height
    3
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
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= desired_height || cell[0] >= desired_width}
  end

  def middle_neighbours(x, y)
    [
      [x - 1, y],
      [x + 1, y]
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= desired_height || cell[0] >= desired_width }
  end

  def bottom_neighbours(x, y)
    [
      [x - 1, y - 1],
      [x, y - 1],
      [x + 1, y - 1]
    ].reject { |cell| cell[0].negative? || cell[1].negative? || cell[1] >= desired_height || cell[0] >= desired_width }
  end
end
