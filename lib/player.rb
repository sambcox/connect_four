require './lib/cell'
require './lib/game'
require './lib/board'
require './lib/turn'

class Player
  attr_reader :name
  def initialize(name = "Guest")
    @name = name.capitalize
  end
end
