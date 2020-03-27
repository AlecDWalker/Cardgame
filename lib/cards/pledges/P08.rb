# frozen_string_literal: true

require './card.rb'

class P08 < Pledge
  def initialize
    @title = "I'm Not Corrupt, I'm Smart"
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 2 INFLUENCE. Each other player LOCKS 1 VOTER'
  end

  def effect
    current_player.add_influence(2)
    @players.except(current_player).each do |player|
      player.lock_voters(1)
    end
  end
end
