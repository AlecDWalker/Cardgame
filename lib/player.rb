# frozen_string_literal: true

require 'deck'
require 'cards/card'
require 'cards/advisors/advisor'
require 'cards/rumour'

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
    if card.is_a? Advisor
      @advisors << card
    elsif card.is_a? Rumour
      print 'Rumour quashed'
    else
      @deck.cards << card
    end
    @hand.delete(card)
  end

  def trigger_advisors
    @advisors.each(&:effect)
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
