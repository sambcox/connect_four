require './lib/turn'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/game'

RSpec.describe Turn do
  it 'exists' do
    new_board = Board.new
    new_turn = Turn.new(new_board)

    expect(new_turn).to be_a(Turn)
  end

  it 'has a board' do
    new_board = Board.new
    new_turn = Turn.new(new_board)

    expect(new_turn.board).to eq(new_board)
  end
end
