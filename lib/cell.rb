class Cell
  attr_reader :piece
  def initialize
    @piece = nil
  end

  def add_piece
    @piece = "X"
  end

  def computer_add_piece
    @piece = "O"
  end

  def printing
    if @piece == nil
      "."
    else
      @piece
    end
  end

  def empty?
    @piece == nil
  end
end
