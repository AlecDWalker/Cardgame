# frozen_string_literal: true

require './card.rb'

class P19 < Pledge
  def initialize
    @title = "I'm Harmless, I Promise"
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Lose all your INFLUENCE and gain three times that many VOTERS'
  end

  def effect
    count = ((current_player.influence_count)*3)
    current_player.lose_influence(current_player.influence_count)
    current_player.gain_voters(count)
  end
end
