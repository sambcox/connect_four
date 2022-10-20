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

      @columns.each do |column, row|
      6.times{ row << Cell.new}
      end
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
            if cell.empty?
              cell.computer_add_piece
            end
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
