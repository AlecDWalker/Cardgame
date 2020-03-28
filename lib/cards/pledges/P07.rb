# frozen_string_literal: true

require './card.rb'

class P07 < Pledge
  def initialize
    @title = 'Act Cool in Public'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Steal 4 VOTERS from a player with more INFLUENCE than you'
  end

  def effect
    target(opponent)
    if current_player.influence_count < opponent.influence_count
      current_player.steal_voters(opponent, 3)
    end
  end
end
