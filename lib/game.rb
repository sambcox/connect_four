require './lib/cell'

class Game
  attr_reader :board
  def initialize(board)
    @board = board
  end

  puts @board.board.columns.values
end
