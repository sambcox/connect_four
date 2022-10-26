require './lib/board'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/game'

RSpec.describe Board do
  it 'exists' do
    board = Board.new

    expect(board).to be_a(Board)

  end

  it 'has columns' do
    board = Board.new

    expect(board.columns).to be_a(Hash)
    expect(board.columns["A"]).to be_a(Array)
  end

  it 'columns have cells' do
    board = Board.new

    expect(board.columns["A"][0]).to be_a(Cell)
  end

  describe '#win_game?' do
    it 'can win horizontally in any row' do
      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.pc_place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.pc_place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("A")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")
    end

    it 'can win vertically in any column' do
      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("A")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("E")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("F")
      game.turn.place_piece("F")
      game.turn.place_piece("F")
      game.turn.place_piece("F")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("G")
      game.turn.place_piece("G")
      game.turn.place_piece("G")
      game.turn.place_piece("G")

      expect(game.board.win_game?).to eq("X")
    end

    it 'can win diagonally in all possible areas' do
      game = Game.new
      game.test_start
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("E")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("E")
      game.turn.place_piece("E")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("E")
      game.turn.pc_place_piece("F")
      game.turn.place_piece("D")
      game.turn.place_piece("E")
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("F")
      game.turn.place_piece("F")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("D")
      game.turn.place_piece("E")
      game.turn.place_piece("F")
      game.turn.pc_place_piece("G")
      game.turn.place_piece("E")
      game.turn.place_piece("F")
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("G")
      game.turn.place_piece("G")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.pc_place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.pc_place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("A")
      game.turn.place_piece("B")
      game.turn.place_piece("C")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("F")
      game.turn.pc_place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")


      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("F")
      game.turn.pc_place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("F")
      game.turn.pc_place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("G")
      game.turn.pc_place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("G")
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("D")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("C")

      expect(game.board.win_game?).to eq("X")


    game = Game.new
      game.test_start
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("E")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("F")
      game.turn.pc_place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("F")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("C")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("B")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("E")
      game.turn.pc_place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.place_piece("E")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("B")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("A")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.place_piece("A")

      expect(game.board.win_game?).to eq("X")

      game = Game.new
      game.test_start
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("C")
      game.turn.pc_place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("B")
      game.turn.place_piece("A")
      game.turn.pc_place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("A")
      game.turn.place_piece("D")
      game.turn.pc_place_piece("C")
      game.turn.place_piece("B")
      game.turn.place_piece("A")
      game.turn.place_piece("D")
      game.turn.place_piece("C")
      game.turn.place_piece("B")
      game.turn.place_piece("A")

      expect(game.board.win_game?).to eq("X")
    end
  end

  describe "#endgame?" do
    it 'can tell if the board is full' do
      game = Game.new
      game.test_start
      6.times do
        game.turn.place_piece("A")
        game.turn.pc_place_piece("B")
        game.turn.place_piece("C")
        game.turn.place_piece("D")
        game.turn.place_piece("G")
        game.turn.place_piece("F")
        game.turn.place_piece("E")
      end

      expect(game.board.endgame?).to eq(true)
    end
  end
end
