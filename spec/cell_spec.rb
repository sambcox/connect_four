require "./lib/cell"

RSpec.describe Cell do
  describe "#initialize" do
    it "exists" do
      cell = Cell.new

      expect(cell).to be_a(Cell)
    end

    it "is nil by default" do
      cell = Cell.new

      expect(cell.piece).to eq(nil)
    end
  end

  describe "#add_piece" do
    it "accepts a piece" do
      cell = Cell.new
      cell.add_piece

      expect(cell.piece).to eq("X")
    end
  end
end