# frozen_string_literal: true

require './card.rb'

class P06 < Pledge
  def initialize
    @title = 'You Can Count On Me'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 2 VOTERS and LOCK 1 VOTER'
  end

  def effect
    current_player.gain_voters(2)
    current_player.lock_voters(1)
  end
end
