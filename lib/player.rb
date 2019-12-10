# frozen_string_literal: true

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

  def add_voters(num)
    @voters += num
  end

  def lose_voters(num)
    @voters -= num
    @voters = 0 if @voters.negative?
  end

  def add_influence(num)
    @influence += num
  end

  def lose_influence(num)
    @influence -= num
    @influence = 0 if @influence.negative?
  end
end
