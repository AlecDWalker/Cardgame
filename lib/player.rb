# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'

class Player
  attr_accessor :deck, :hand, :advisors
  def initialize(name)
    @name = name
    @unlocked_voters = 0
    @locked_voters = 0
    @influence = 0
    @deck = Deck.new
    @hand = []
    @advisors = []
  end

  def return_name
    @name
  end

  def voter_count
    @unlocked_voters + @locked_voters
  end

  def unlocked_voter_count
    @unlocked_voters
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
    self.lose_influence(card.return_cost)
    card.effect
    card.resolve(self)
    @hand.delete(card)
  end

  def trigger_advisors
    @advisors.each { |advisor| return advisor.effect }
  end

  def gain_voters(num)
    @unlocked_voters += num
  end

  def lose_voters(num)
    @unlocked_voters -= num
    @unlocked_voters = 0 if @unlocked_voters.negative?
  end

  def lock_voters(num)
    num.times do
      @locked_voters += 1 if @unlocked_voters > 0
      lose_voters(1)
    end
  end

  def steal_voters(target, num)
    num.times do
      gain_voters(1) if target.unlocked_voter_count.positive?
      target.lose_voters(1)
    end
  end

  def add_influence(num)
    @influence += num
  end

  def lose_influence(num)
    @influence -= num
    @influence = 0 if @influence.negative?
  end

  def gain_rumour
    @deck.cards.unshift(Rumour.new)
  end

  def spin
    number = rand(1..8)
    lose_voters(1) if number == 1
    lose_voters(2) if number == 2
    draw_card(1) if number == 3
    draw_card(2) if number == 4
    add_influence(1) if number == 5
    add_influence(2) if number == 6
    gain_voters(1) if number == 7
    gain_voters(2) if number == 8
  end

end
