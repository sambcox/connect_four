require "./lib/game"

RSpec.describe Game do
  describe "#initialize" do
    it "exists" do
      game = Game.new

      expect(game).to be_a(Game)
    end

    it "has a board" do
      game = Game.new
      game.test_start

      expect(game.board).to be_a(Board)
    end
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
end