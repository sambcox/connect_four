require './lib/turn'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/game'

RSpec.describe Turn do
  it 'exists' do
    
    new_turn = Turn.new

    expect(new_turn).to be_a(Turn)
  end
end
