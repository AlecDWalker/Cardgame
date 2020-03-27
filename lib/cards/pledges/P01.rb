# frozen_string_literal: true

require './card.rb'

class P01 < Pledge
  def initialize
    @title = 'I Like Steady Growth'
    @card_type = 'Pledge'
    @cost = 1
    @text = 'Gain 3 VOTERS and 2 INFLUENCE'
  end

  def effect
    current_player.gain_voters(3)
    current_player.add_influence(2)
  end
end
