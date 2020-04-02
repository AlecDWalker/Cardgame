# frozen_string_literal: true

require './card.rb'

class P21 < Pledge
  def initialize
    @title = 'I Will Buy My Voters a Pint!'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Lose all your INFLUENCE and LOCK 1 VOTER for each INFLUENCE lost this way'
  end

  def effect
    current_player.lock_voters(current_player.influence_count)
    current_player.lose_influence(current_player.influence_count)
  end
end
