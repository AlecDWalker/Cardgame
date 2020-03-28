# frozen_string_literal: true

require './card.rb'

class P15 < Pledge
  def initialize
    @title = 'We All Like Money, Right?'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 1 INFLUENCE, then gain 1 VOTER for each INFLUENCE you have'
  end

  def effect
    current_player.add_influence(1)
    current_player.gain_voters(current_player.influence_count)
  end
end
