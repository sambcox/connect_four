require './lib/cell'
require './lib/game'

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
    board_turned_90 = {}
    columns.each do |header, column|
      column.each do |cell|
        if board_turned_90.keys.include?(column.index(cell))
          board_turned_90[column.index(cell)] << cell.piece
        else
          board_turned_90[column.index(cell)] = [cell.piece]
        end
      end
    end
    board_turned_90.each { |header, row| puts row.join(" ")}
  end

  def user_take_turn
    user_input = gets.chomp
    if "ABCDEFG".include? user_input.upcase
      place_piece(user_input)
    else
      puts "That is an invalid input! Please select a letter between A and G."
      user_take_turn
    end
  end

  def two_player_take_turn
    user_input = gets.chomp
    if "ABCDEFG".include? user_input.upcase
      user_place_piece(user_input)
    else
      puts "That is an invalid input! Please select a letter between A and G."
      two_player_take_turn
    end
  end

  def computer_take_turn
      computer_input = columns.keys.shuffle.shuffle.first
      pc_place_piece(computer_input)
  end

  def user_place_piece(column_inputted)
    if columns[column_inputted.upcase][5].empty? == false
      puts "That column is full! Please select another"
      user2_take_turn
    else
      columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.computer_add_piece if cell.empty?
          end
        end
      end
    end
  end

  def pc_place_piece(column_inputted)
    if columns[column_inputted.upcase][5].empty? == false
      computer_take_turn
    else
      columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.computer_add_piece if cell.empty?
          end
        end
      end
    end
  end

  def place_piece(column_inputted)
    if columns[column_inputted.upcase][5].empty? == false
      puts "That column is full! Please select another."
      place_piece(gets.chomp)
    else
      columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.add_piece if cell.empty?
          end
        end
      end
    end
  end

  def horizontal_win?
    consecutive_rows = []
    board_turned_90 = {}
    columns.each do |header, column|
      column.each do |cell|
        if board_turned_90.keys.include?(column.index(cell))
          board_turned_90[column.index(cell)] << cell
        else
          board_turned_90[column.index(cell)] = [cell]
        end
      end
    end
  
    board_turned_90.values.map { |value| value.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}}
      
    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
  end
  
  def vertical_win?
    consecutive_rows = []
  
    columns.values.map { |column| column.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}}
  
    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
  end
  
  def diagonal_win?
    consecutive_rows = []
    diag = {}
  
    diag[1] = columns.values.flatten.select.with_index{|_,i| i % 7 == 0}
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
  
    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
  end
  
  def win_game?
    if horizontal_win?
      return true
    elsif vertical_win?
      return true
    elsif diagonal_win?
      return true
    else
      return false
    end
  end
  
  def endgame?
    columns.map { |header, column| column.last.empty?}.find_all { |cell| cell == false}.length == 7
  end
end
