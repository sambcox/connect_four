require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    player1 = Player.new("Bob")

    expect(player1).to be_a(Player)
  end
  it 'has a name' do
    player1 = Player.new("Bob")

    expect(player1.name).to eq("Bob")
  end
  
end
