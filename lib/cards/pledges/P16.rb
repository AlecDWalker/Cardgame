# frozen_string_literal: true

require './card.rb'

class P16 < Pledge
  def initialize
    @title = 'I Hear You, I Do ... However...'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 2 VOTERS and draw 2 cards'
  end

  def effect
    current_player.gain_voters(2)
    current_player.draw_card(2)
  end
end
