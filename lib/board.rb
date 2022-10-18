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
    columns.each do |column, row|
      if column_inputted.downcase == column.downcase && row[0].empty?
        row[0].add_piece
        return
      elsif
        column_inputted.downcase == column.downcase && row[1].empty?
        row[1].add_piece
        return
      elsif
        column_inputted.downcase == column.downcase && row[2].empty?
        row[2].add_piece
        return
      elsif
        column_inputted.downcase == column.downcase && row[3].empty?
        row[3].add_piece
        return
      elsif
        column_inputted.downcase == column.downcase && row[4].empty?
        row[4].add_piece
        return
      elsif
        column_inputted.downcase == column.downcase && row[5].empty?
        row[5].add_piece
        return
      else
        puts "That column is full! Please choose another"
        place_piece(gets.chomp)
      end
    end
  end
end
