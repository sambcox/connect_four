require "./lib/game"

RSpec.describe Game do
  describe "#initialize" do
    it "exists" do
      game = Game.new

      expect(game).to be_a(Game)
    end

    it "has a board" do
      game = Game.new

      expect(game.board).to be_a(Board)
    end
  end
end