require './lib/cell'
require './lib/player'
require './lib/board'
require './lib/turn'

class Game
  attr_reader :board, :player1, :player2, :turn
  def initialize
    @player1 = nil
    @player2 = nil
    @board = nil
    @turn = nil
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
    @turn = Turn.new(board)
    board.print_board
    player1_take_turn
  end

  def test_start
    @board = Board.new
    @turn = Turn.new(board)
    @player1 = Player.new("Mike")
    @player2 = Player.new("Sam")
  end

  def start
    @board = Board.new
    @turn = Turn.new(@board)
    board.print_board
    game_user_take_turn
  end

  def game_user_take_turn
    overall_win_game if board.win_game? != false
    draw_game if board.endgame?
    puts "--------------------------------"
    puts "Please enter a letter between A and G"
    puts "--------------------------------"
    turn.user_take_turn
    board.print_board
    game_pc_take_turn
  end

  def game_pc_take_turn
    overall_win_game if board.win_game? != false
    draw_game if board.endgame?
    puts "--------------------------------"
    turn.computer_take_turn
    board.print_board
    game_user_take_turn
  end

  def player1_take_turn
    player_win_game if board.win_game? != false
    draw_game if board.endgame?
    puts "--------------------------------"
    puts "#{player1.name}, please enter a letter between A and G"
    puts "--------------------------------"
    turn.user_take_turn
    board.print_board
    player2_take_turn
  end

  def player2_take_turn
    player_win_game if board.win_game? != false
    draw_game if board.endgame?
    puts "--------------------------------"
    puts "#{player2.name}, please enter a letter between A and G"
    puts "--------------------------------"
    turn.two_player_take_turn
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
    play_again
  end

  def overall_win_game
    puts "--------------------------------"
    if board.win_game? == "X"
      puts "You've won!"
    else
      puts "You've lost!"
    end
    play_again
  end

  def player_win_game
    winner = nil
    loser = nil
    if board.win_game? == "X"
      winner = player1
      loser = player2
    else
      winner = player2
      loser = player1
    end
    puts "--------------------------------"
    puts "Congratulations #{winner.name}, you've won! Better luck next time, #{loser.name}."
    play_again
  end

  def quit_game
    puts "--------------------------------"
    puts "Goodbye!"
    abort
  end
end
