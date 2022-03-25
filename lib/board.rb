class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(3) { Array.new(3) { :dead } }
  end
end
