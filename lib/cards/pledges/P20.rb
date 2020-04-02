# frozen_string_literal: true

require './card.rb'

class P20 < Pledge
  def initialize
    @title = 'Infamy! Infamy!'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 3 lock_voters for each RUMOUR in your hand'
  end

  def effect
    count = 0
    current_player.hand.each do |card|
      count += 3 if card.is_a? Rumour
    end
    current_player.gain_voters(count)
  end
end
