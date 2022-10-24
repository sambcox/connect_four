require './lib/cell'
require './lib/player'
require './lib/board'

class Game
  attr_reader :board, :player1, :player2
  def initialize
    @player1 = nil
    @player2 = nil
    @board = nil
  end

  def main_menu
    puts "Welcome to Connect Four!"
    puts "To play against PC, press c. To play with a friend, press p. To quit, press q."

    want_to_play = gets.chomp.downcase
    if want_to_play == "c"
      start
    elsif want_to_play == "p"
      two_player_start
    elsif want_to_play == "q"
      quit_game
    else puts "Invalid input, please press p or q"
      main_menu
    end
  end

  def two_player_start
    puts "Please enter player 1 name"
    @player1 = Player.new(gets.chomp)
    puts "Please enter player 2 name"
    @player2 = Player.new(gets.chomp)
    @board = Board.new
    board.print_board
    player1_take_turn
  end

  def test_start
    @board = Board.new
  end

  def start
    @board = Board.new
    board.print_board
    game_user_take_turn
  end

  def game_user_take_turn
    computer_win_game if win_game?
    draw_game if endgame?
    puts "--------------------------------"
    board.user_take_turn
    board.print_board
    game_pc_take_turn
  end

  def game_pc_take_turn
    person_win_game if win_game?
    draw_game if endgame?
    puts "--------------------------------"
    board.computer_take_turn
    board.print_board
    game_user_take_turn
  end

  def player1_take_turn
    player2_win_game if win_game?
    draw_game if endgame?
    puts "#{player1.name}, please enter a letter between A and G"
    puts "--------------------------------"
    board.user_take_turn
    board.print_board
    player2_take_turn
  end

  def player2_take_turn
    player1_win_game if win_game?
    draw_game if endgame?
    puts "#{player2.name}, please enter a letter between A and G"
    puts "--------------------------------"
    board.two_player_take_turn
    board.print_board
    player1_take_turn
  end
  
  def play_again
    puts "To play against PC, press c. To play with a friend, press p. To quit, press q."

    want_to_play = gets.chomp.downcase
    if want_to_play == "c"
      start
    elsif want_to_play == "p"
      two_player_start
    elsif want_to_play == "q"
      quit_game
    else puts "Invalid input, please press p or q"
      play_again
    end
  end

  def horizontal_win?
    consecutive_rows = []

    board.columns.map { |column, row| row[0].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[1].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[2].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[3].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[4].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns.map { |column, row| row[5].piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
  end

  def vertical_win?
    consecutive_rows = []

    board.columns["A"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["B"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["C"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["D"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["E"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["F"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["G"].map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
  end

  def diagonal_win?
    consecutive_rows = []

    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 0}
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| (i + 8) % 7 == 0}
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 5}
    diag.shift
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 4}
    diag.shift(2)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 1}
    diag.pop
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 2}
    diag.pop(2)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 4}
    diag.pop(3)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag.pop(4)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag.shift(4)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 2}
    diag.shift(3)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 1}
    diag.pop
    diag.shift(2)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 0}
    diag.shift
    diag.pop(2)
    diag.map { |cell| cell.piece}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

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
    board.columns.map { |column, row| row.last.empty?}.find_all { |cell| cell == false}.length == 7
  end

  def draw_game
    puts "Thank you for playing! This game is a draw."
    main_menu
  end

  def person_win_game
    puts "--------------------------------"
    puts "You've won!"
    play_again
  end

  def computer_win_game
    puts "--------------------------------"
    puts "You've lost!"
    play_again
  end

  def player1_win_game
    puts "--------------------------------"
    puts "Congratulations #{player1.name}, you've won! Better luck next time, #{player2.name}."
    play_again
  end

  def player2_win_game
    puts "--------------------------------"
    puts "Congratulations #{player2.name}, you've won! Better luck next time, #{player1.name}."
    play_again
  end

  def quit_game
    puts "--------------------------------"
    puts "Goodbye!"
    abort
  end
end
