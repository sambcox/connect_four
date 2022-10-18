require './lib/cell'

class Board
  attr_reader :columns
  def initialize
    @columns = {
      "A" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "B" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "C" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "D" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "E" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "F" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new],
      "G" => [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new]
    }
  end
end
