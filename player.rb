class Player
  attr_accessor :playerName, :blood, :mana
  
  def initialize playerName
	@playerName = playerName
    @blood = 100
    @mana = 40
  end
  
  def attack
    @mana = @mana - 20
  end
  
  def defense
    @blood = @blood - 20
  end
  
  def isGameOver
     @mana <= 0 || @blood <=0
  end

end