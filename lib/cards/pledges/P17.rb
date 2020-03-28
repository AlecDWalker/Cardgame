# frozen_string_literal: true

require './card.rb'

class P17 < Pledge
  def initialize
    @title = 'I Have Big Ideas'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 1 VOTER for each other card in your hand'
  end

  def effect
    current_player.gain_voters(current_player.hand.count - 1)
  end
end
