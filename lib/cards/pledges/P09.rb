# frozen_string_literal: true

require './card.rb'

class P09 < Pledge
  def initialize
    @title = "You Have a Lovely House, Ma'm"
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 1 INFLUENCE and STEAL 2 VOTERS'
  end

  def effect
    current_player.add_influence(1)
    target(opponent1, opponent2)
    current_player.steal_voters(opponent1, 1)
    current_player.steal_voters(opponent2, 1)
  end
end
