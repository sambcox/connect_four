require './lib/cell'

require './lib/board'

class Game
  attr_reader :board
  def initialize
    @board = nil
  end

  def main_menu
    puts "Welcome to Connect Four!"
    puts "To play, press p. To quit, press q."

    want_to_play = gets.chomp.downcase
    if want_to_play == "p"
      start
    elsif want_to_play == "q"
      quit_game
    else puts "Invalid input, please press p or q"
      main_menu
    end
  end

  def start
    @board = Board.new
    print_board
    game_user_take_turn
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
    computer_win_game if win_game == true
    puts "--------------------------------"
    board.user_take_turn
    print_board
    game_pc_take_turn
  end

  def game_pc_take_turn
    person_win_game if win_game
    puts "--------------------------------"
    board.computer_take_turn
    print_board
    game_user_take_turn unless endgame == true
    draw_game
  end

  def test_start
    @board = Board.new
  end

  def draw_game
    puts "Thank you for playing! This game is a draw."
    main_menu
  end

  def play_again
    puts "If you would like to play again, press p, to quit, press q"

    want_to_play = gets.chomp.downcase
    if want_to_play == "p"
      start
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

    board.columns["A"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["B"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["C"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["D"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["E"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["F"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    board.columns["G"].map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 0}
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| (i + 8) % 7 == 0}
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 5}
    diag.shift
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 4}
    diag.shift(2)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 1}
    diag.pop
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 7 == 2}
    diag.pop(2)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 4}
    diag.pop(3)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag.pop(4)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 3}
    diag.shift(4)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 2}
    diag.shift(3)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 1}

    diag.pop
    diag.shift(2)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}

    diag = board.columns.values.flatten.select.with_index{|_,i| i % 5 == 0}
    diag.shift

    diag.pop(2)
    diag.map { |cell| cell.printing}.each_cons(4) { |consecutive| consecutive_rows << consecutive}
    

    consecutive_rows.any?(["X", "X", "X", "X"]) ||
    consecutive_rows.any?(["O", "O", "O", "O"])
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

  def quit_game
    puts "--------------------------------"
    puts "Goodbye!"
    abort
  end


end
