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

  it 'adds pieces to the board' do
    new_board = Board.new
    new_turn = Turn.new(new_board)

    new_turn.place_piece('a')

    expect(new_turn.board.columns["A"][0].empty?).to eq(false)
  end

  it 'pieces stack in columns' do
    new_board = Board.new
    new_turn = Turn.new(new_board)


    new_turn.place_piece('a')
    new_turn.place_piece('a')

    expect(new_turn.board.columns["A"][0].empty?).to eq(false)
    expect(new_turn.board.columns["A"][1].empty?).to eq(false)
    expect(new_turn.board.columns["A"][2].empty?).to eq(true)
  end

  it 'can have a PC take turn' do
    new_board = Board.new
    new_turn = Turn.new(new_board)

    new_turn.computer_take_turn
    expect(new_turn.board.columns.map { |header, column| column.first.empty?}.find_all { |cell| cell == false}.length).to eq(1)
  end
end
