# frozen_string_literal: true

class Draft
  def initialize(cardpool, player_array)
    @cardpool = cardpool
    @player_array = player_array
    @selection = []
    @chooser = 0
    3.times { deal(0) }
  end

  def return_players
    @player_array
  end

  def deal(n)
    @selection.insert(n, @cardpool.shift) if @cardpool.any?
  end

  def return_selection
    if @selection.any?
      @selection
    else
      "All cards drafted, let the game begin!"
    end
  end

  def choose(n)
    deal(n)
    @selection.slice!(n - 1)
  end

end
