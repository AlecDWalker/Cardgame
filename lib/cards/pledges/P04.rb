# frozen_string_literal: true

require './card.rb'

class P04 < Pledge
  def initialize
    @title = 'Taxes? Who Needs Them?'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 2 VOTERS and 1 INFLUENCE'
  end

  def effect
    current_player.gain_voters(2)
    current_player.add_influence(1)
  end
end
