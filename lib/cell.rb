class Cell
  attr_reader :piece
  def initialize
    @piece = "."
  end

  def add_piece
    @piece = "X"
  end

  def computer_add_piece
    @piece = "O"
  end

  def empty?
    @piece == "."
  end
end
