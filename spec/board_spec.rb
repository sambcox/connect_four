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
end
