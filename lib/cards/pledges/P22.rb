# frozen_string_literal: true

require './card.rb'

class P22 < Pledge
  def initialize
    @title = 'What They Said, Only Faster'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Steal 3 VOTERS from another player'
  end

  def effect
    target(opponent)
    current_player.steal_voters(opponent, 3)
end
