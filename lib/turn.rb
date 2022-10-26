require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

class Turn
  attr_reader :board
  def initialize(board)
    @board = board
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
      computer_input = board.columns.keys.shuffle.shuffle.first
      pc_place_piece(computer_input)
  end

  def user_place_piece(column_inputted)
    if board.columns[column_inputted.upcase][5].empty? == false
      puts "That column is full! Please select another"
      user2_take_turn
    else
      board.columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.computer_add_piece if cell.empty?
          end
        end
      end
    end
  end

  def pc_place_piece(column_inputted)
    if board.columns[column_inputted.upcase][5].empty? == false
      computer_take_turn
    else
      board.columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.computer_add_piece if cell.empty?
          end
        end
      end
    end
  end

  def place_piece(column_inputted)
    if  board.columns[column_inputted.upcase][5].empty? == false
      puts "That column is full! Please select another."
      place_piece(gets.chomp)
    else
      board.columns.find do |column, row|
        if column_inputted.downcase == column.downcase
          row.find do |cell|
            cell.add_piece if cell.empty?
          end
        end
      end
    end
  end
end
