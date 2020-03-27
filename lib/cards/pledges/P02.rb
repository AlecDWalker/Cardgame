# frozen_string_literal: true

require './card.rb'

class P02 < Pledge
  def initialize
    @title = 'Money is Power!'
    @card_type = 'Pledge'
    @cost = 3
    @text = 'Gain 10 VOTERS and LOCK 3 VOTERS'
  end

  def effect
    current_player.gain_voters(10)
    current_player.lock_voters(3)
  end
end
