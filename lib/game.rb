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

  def endgame
    board.columns.map { |column, row| row.last.empty?}.find_all { |cell| cell == false}.length == 7
  end

  def game_user_take_turn
    win_game
    board.user_take_turn
    print_board
    game_user_take_turn
  end

  def game_pc_take_turn
    win_game
    board.computer_take_turn
    print_board
    game_user_take_turn unless endgame == true
    draw_game
  end


  def draw_game
    puts "Thank you for playing! This game is a draw."
    main_menu
  end

  def play_again
    puts "If you would like to play again, press p, to quit, press q"

    want_to_play = gets.chomp.downcase
    if want_to_play == "p"
      print_board
      game_user_take_turn
    elsif want_to_play == "q"
      quit_game
    else puts "Invalid input, please press p or q"
      play_again
    end
  end

  def win_game
    consecutive_rows = []
    board.columns.map { |column, row| row[0].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[1].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[2].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[3].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[4].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[5].printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    person_win_game if consecutive_rows.any?(["X", "X", "X", "X"])
  end

  def person_win_game
    puts "You've won!"
    play_again
  end

  def quit_game
    puts "Goodbye!"
  end


end
