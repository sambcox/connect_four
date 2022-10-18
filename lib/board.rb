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

  def place_piece(column_inputted)
    columns.find do |column, row|
      column_inputted.downcase == column.downcase
      row.find do |cell|
        cell.add_piece if cell.empty?
      end
    end
  end
end
