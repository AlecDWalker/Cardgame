# frozen_string_literal: true

require './card.rb'

class P11 < Pledge
  def initialize
    @title = 'I Believe in Business'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 1 INFLUENCE'
  end

  def effect
    current_player.add_influence(1)
  end
end
