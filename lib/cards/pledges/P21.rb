# frozen_string_literal: true

require './card.rb'

class P21 < Pledge
  def initialize
    @title = 'Master of Bad Press'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Draw 1 card for each RUMOUR in your hand'
  end

  def effect
    count = 0
    current_player.hand.each do |card|
      count += 1 if card.is_a? Rumour
    end
    current_player.draw_card(count)
  end
end
