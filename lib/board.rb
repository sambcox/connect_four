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
    consecutive_diagonals = []

    (0..2).each do |start_row|
      (0..3).each do |start_col|
        diagonal = (0..3).map do |i|
          columns[columns.keys[(start_col + i)]][(start_row + i)].piece
        end
        consecutive_diagonals << diagonal
      end
    end

    (0..2).each do |start_row|
      (3..6).each do |start_col|
        diagonal = (0..3).map do |i|
          columns[columns.keys[(start_col - i)]][(start_row + i)].piece
        end
        consecutive_diagonals << diagonal
      end
    end

    return "X" if consecutive_diagonals.any? { |diagonal| diagonal.all?("X") }
    return "O" if consecutive_diagonals.any? { |diagonal| diagonal.all?("O") }
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
