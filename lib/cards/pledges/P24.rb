# frozen_string_literal: true

require './card.rb'

class P24 < Pledge
  def initialize
    @title = 'Everyone Deserves a Second Chance'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'If the top card of your deck is a RUMOUR, remove it. Repeat this process until the top card of your deck is not a RUMOUR'
  end

  def effect
    while current_player.deck.cards[0].is_a? Rumour do
      puts "Rumour quashed"
      current_player.deck.cards.shift
    end
  end

end
