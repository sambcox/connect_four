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
    computer_win_game if board.win_game?
    draw_game if board.endgame?
    puts "--------------------------------"
    puts "Please enter a letter between A and G"
    board.user_take_turn
    board.print_board
    game_pc_take_turn
  end

  def game_pc_take_turn
    person_win_game if board.win_game?
    draw_game if board.endgame?
    puts "--------------------------------"
    board.computer_take_turn
    board.print_board
    game_user_take_turn
  end

  def player1_take_turn
    player2_win_game if board.win_game?
    draw_game if board.endgame?
    puts "#{player1.name}, please enter a letter between A and G"
    puts "--------------------------------"
    board.user_take_turn
    board.print_board
    player2_take_turn
  end

  def player2_take_turn
    player1_win_game if board.win_game?
    draw_game if board.endgame?
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
