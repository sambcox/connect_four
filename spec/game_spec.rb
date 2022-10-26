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

    it 'has turns' do
      game = Game.new
      game.test_start

      expect(game.turn).to be_a(Turn)
    end

    it 'can have two players' do
      game = Game.new
      game.test_start

      expect(game.player1.name).to eq("Mike")
      expect(game.player2.name).to eq("Sam")
    end
  end
end
