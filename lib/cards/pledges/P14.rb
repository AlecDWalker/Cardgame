# frozen_string_literal: true

require './card.rb'

class P14 < Pledge
  def initialize
    @title = "I Won't Kiss Any Babies"
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 1 VOTER and 1 INFLUENCE'
  end

  def effect
    current_player.gain_voters(1)
    current_player.add_influence(1)
  end
end
