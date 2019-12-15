# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'

class Player
  attr_accessor :deck, :hand, :advisors
  def initialize(name)
    @name = name
    @voters = 0
    @influence = 0
    @deck = Deck.new
    @hand = []
    @advisors = []
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

  def return_hand
    @hand
  end

  def return_advisors
    @advisors
  end

  def draw_card(n)
    n.times { @hand << @deck.draw_card }
  end

  def play(card)
    card.effect
    card.resolve(self)
    @hand.delete(card)
  end

  def trigger_advisors
    @advisors.each { |advisor| return advisor.effect }
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
