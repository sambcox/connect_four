require './lib/cell'
require './lib/game'
require './lib/turn'
require './lib/player'

class Board
  attr_reader :columns
  def initialize
    @columns = {
      "A" => [],
      "B" => [],
      "C" => [],
      "D" => [],
      "E" => [],
      "F" => [],
      "G" => []
    }

    @columns.each { |column, row| 6.times{ row << Cell.new}}
  end

  def print_board
    puts columns.keys.join(" ")

    columns.values.transpose.reverse.map do |row|
      joined_row = row.map do |cell|
        cell.piece
      end
      puts joined_row.join(" ")
    end
  end

  def horizontal_win?
    consecutive_rows = []

    columns.values.transpose.reverse.map { |value| value.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}}

    return "X" if consecutive_rows.any?(["X", "X", "X", "X"])
    return "O" if consecutive_rows.any?(["O", "O", "O", "O"])
  end

  def vertical_win?
    consecutive_rows = []

    columns.values.map { |column| column.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}}

    return "X" if consecutive_rows.any?(["X", "X", "X", "X"])
    return "O" if consecutive_rows.any?(["O", "O", "O", "O"])
  end

  def diagonal_win?
    consecutive_rows = []
    diag = {}

    diag[1] = columns.values.flatten.select.with_index{|cell, i| i % 7 == 0}
    diag[2] = columns.values.flatten.select.with_index{|_,i| (i + 8) % 7 == 0}
    diag[3] = columns.values.flatten.select.with_index{|_,i| i % 7 == 5}
    diag[3].shift
    diag[4] = columns.values.flatten.select.with_index{|_,i| i % 7 == 4}
    diag[4].shift(2)
    diag[5] = columns.values.flatten.select.with_index{|_,i| i % 7 == 1}
    diag[5].pop
    diag[6] = columns.values.flatten.select.with_index{|_,i| i % 7 == 2}
    diag[6].pop(2)
    diag[7] = columns.values.flatten.select.with_index{|_,i| i % 5 == 4}
    diag[7].pop(3)
    diag[8] = columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag[8].pop(4)
    diag[9] = columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag[9].shift(4)
    diag[10] = columns.values.flatten.select.with_index{|_,i| i % 5 == 2}
    diag[10].shift(3)
    diag[11] = columns.values.flatten.select.with_index{|_,i| i % 5 == 1}
    diag[11].pop
    diag[11].shift(2)
    diag[12] = columns.values.flatten.select.with_index{|_,i| i % 5 == 0}
    diag[12].shift
    diag[12].pop(2)

    diag.values.map { |value| value.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}}

    return "X" if consecutive_rows.any?(["X", "X", "X", "X"])
    return "O" if consecutive_rows.any?(["O", "O", "O", "O"])
  end

  def win_game?
    if horizontal_win? == "X"
      return "X"
    elsif horizontal_win? == "O"
      return "O"
    elsif vertical_win? == "X"
      return "X"
    elsif vertical_win? == "O"
      return "O"
    elsif diagonal_win? == "X"
      return "X"
    elsif diagonal_win? == "O"
      return "O"
    else
      return false
    end
  end

  def endgame?
    columns.map { |header, column| column.last.empty?}.find_all { |cell| cell == false}.length == 7
  end
end
