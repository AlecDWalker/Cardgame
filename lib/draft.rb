class Draft

  def initialize(cardpool, player_array)
    @cardpool = cardpool
    @player_array = player_array
    @selection = []
    @chooser = 0
    3.times{self.deal(0)}
  end

  def deal(n)
    if @cardpool.empty?
      "Last card has been picked"
    else
      @selection.insert(n, @cardpool.shift)
    end
  end

  def return_selection
    @selection
  end

  def choose(n)
    @selection.slice!(n-1)
    self.deal(n-1)
  end

end
