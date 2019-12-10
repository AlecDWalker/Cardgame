require 'deck'

class Player

  def initialize(name)
    @name = name
    @voters = 0
    @influence = 0
    @deck = Deck.new
  end

  def return_name
    @name
  end

  def voter_count
    @voters
  end

  def influence_count
    @influence
  end

  def deck_count
    @deck.return_cards
  end

  def add_voters(n)
    @voters+=n
  end

  def lose_voters(n)
    @voters-=n
    @voters = 0 if @voters.negative?
  end

  def add_influence(n)
    @influence+=n
  end

  def lose_influence(n)
    @influence-=n
    @influence = 0 if @influence.negative?
  end

end
