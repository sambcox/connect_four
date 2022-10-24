class Player
  attr_reader :name
  def initialize(name = "Guest")
    @name = name.capitalize
  end
end
