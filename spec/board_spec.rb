require './lib/board'
require './lib/cell'

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

  it 'can have pieces added' do
    board = Board.new
    board.place_piece('a')

    expect(board.columns["A"][0].empty?).to eq(false)
  end

  it 'pieces stack in columns' do
    board = Board.new
    board.place_piece('a')
    board.place_piece('a')

    expect(board.columns["A"][0].empty?).to eq(false)
    expect(board.columns["A"][1].empty?).to eq(false)
    expect(board.columns["A"][2].empty?).to eq(true)

  end

  describe '#win_game?' do
    it 'can win horizontally in any row' do
      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)
      
      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.pc_place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.pc_place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.pc_place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.pc_place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.pc_place_piece("A")
      game.board.place_piece("B")
      game.board.pc_place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.pc_place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)
    end

    it 'can win vertically in any column' do
      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("A")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("E")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("F")
      game.board.place_piece("F")
      game.board.place_piece("F")
      game.board.place_piece("F")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("G")
      game.board.place_piece("G")
      game.board.place_piece("G")
      game.board.place_piece("G")

      expect(game.board.win_game?).to eq(true)
    end

    it 'can win diagonally in all possible areas' do
      game = Game.new
      game.test_start
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("D")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.pc_place_piece("E")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("E")
      game.board.place_piece("E")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("E")
      game.board.pc_place_piece("F")
      game.board.place_piece("D")
      game.board.place_piece("E")
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("F")
      game.board.place_piece("F")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("D")
      game.board.place_piece("E")
      game.board.place_piece("F")
      game.board.pc_place_piece("G")
      game.board.place_piece("E")
      game.board.place_piece("F")
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("G")
      game.board.place_piece("G")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.pc_place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("C")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.pc_place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.pc_place_piece("C")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("A")
      game.board.place_piece("B")
      game.board.place_piece("C")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("F")
      game.board.pc_place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")


      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("F")
      game.board.pc_place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("F")
      game.board.pc_place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("G")
      game.board.pc_place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("G")
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("D")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("C")

      expect(game.board.win_game?).to eq(true)
  

    game = Game.new
      game.test_start
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("E")
      game.board.pc_place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("F")
      game.board.pc_place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("F")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("C")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("B")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("D")
      game.board.pc_place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("E")
      game.board.pc_place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.place_piece("E")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("B")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("A")
      game.board.pc_place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("A")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("A")
      game.board.pc_place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.place_piece("A")

      expect(game.board.win_game?).to eq(true)

      game = Game.new
      game.test_start
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("C")
      game.board.pc_place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("B")
      game.board.place_piece("A")
      game.board.pc_place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("A")
      game.board.place_piece("D")
      game.board.pc_place_piece("C")
      game.board.place_piece("B")
      game.board.place_piece("A")
      game.board.place_piece("D")
      game.board.place_piece("C")
      game.board.place_piece("B")
      game.board.place_piece("A")

      expect(game.board.win_game?).to eq(true)
    end
  end

  describe "#endgame?" do
    it 'can tell if the board is full' do
      game = Game.new
      game.test_start
      6.times do 
        game.board.place_piece("A")
        game.board.pc_place_piece("B")
        game.board.place_piece("C")
        game.board.place_piece("D")
        game.board.place_piece("G")
        game.board.place_piece("F")
        game.board.place_piece("E")
      end

      expect(game.board.endgame?).to eq(true)
    end
  end
end
