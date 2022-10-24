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

    row_0 = []
    row_1 = []
    row_2 = []
    row_3 = []
    row_4 = []
    row_5 = []

    columns.each do |key, value|
      row_0 << value[0].piece
      row_1 << value[1].piece
      row_2 << value[2].piece
      row_3 << value[3].piece
      row_4 << value[4].piece
      row_5 << value[5].piece
    end
    puts row_5.join(" ")
    puts row_4.join(" ")
    puts row_3.join(" ")
    puts row_2.join(" ")
    puts row_1.join(" ")
    puts row_0.join(" ")
  end

  def user_take_turn
    puts "Please enter a letter between A and G"
    user_input = gets.chomp
    if "ABCDEFG".include? user_input.upcase
      place_piece(user_input)
    else
      puts "That is an invalid input! Please select a letter between A and G."
      user_take_turn
    end
  end

  def computer_take_turn
      computer_input = columns.keys.shuffle.shuffle.first
      pc_place_piece(computer_input)
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
end
