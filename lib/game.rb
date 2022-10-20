require './lib/cell'

require './lib/board'

class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def main_menu
    puts "Welcome to Connect Four!"
    puts "To play, press p. To quit, press q."

    want_to_play = gets.chomp.downcase
    if want_to_play == "p"
      print_board
      game_user_take_turn
    elsif want_to_play == "q"
      quit_game
    else puts "Invalid input, please press p or q"
      main_menu
    end
  end

  def print_board
    puts self.board.columns.keys.join(" ")

    row_0 = []
    row_1 = []
    row_2 = []
    row_3 = []
    row_4 = []
    row_5 = []

    self.board.columns.each do |key, value|
      row_0 << value[0].printing
      row_1 << value[1].printing
      row_2 << value[2].printing
      row_3 << value[3].printing
      row_4 << value[4].printing
      row_5 << value[5].printing
    end
    puts row_5.join(" ")
    puts row_4.join(" ")
    puts row_3.join(" ")
    puts row_2.join(" ")
    puts row_1.join(" ")
    puts row_0.join(" ")
  end

  def game_user_take_turn
    board.user_take_turn
    print_board
    game_pc_take_turn
  end

  def game_pc_take_turn
    board.computer_take_turn
    print_board
    game_user_take_turn
  end


  def quit_game
    puts "Thank you for playing!"
  end

end
