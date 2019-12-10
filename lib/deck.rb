# frozen_string_literal: true

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def draw_card(num)
    num.times { @cards.shift }
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def return_cards
    @cards
  end
end
