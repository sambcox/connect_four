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
end
