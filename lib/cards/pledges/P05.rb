# frozen_string_literal: true

require './card.rb'

class P05 < Pledge
  def initialize
    @title = 'I Like Flags'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 2 VOTERS and draw 1 card'
  end

  def effect
    current_player.gain_voters(2)
    current_player.draw_card(1)
  end
end
