class Cell
  attr_reader :piece
  def initialize
    @piece = nil
  end

  def add_piece
    @piece = "X"
  end
end