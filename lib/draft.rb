class Draft

  def initialize(cardpool, player_array)
    @cardpool = cardpool
    @player_array = player_array
    @selection = []
    @chooser = 0
    3.times{self.deal}
  end

  def deal
    @selection << @cardpool.shift
  end

  def return_selection
    @selection
  end

end
