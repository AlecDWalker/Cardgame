# frozen_string_literal: true

require './card.rb'

class P25 < Pledge
  def initialize
    @title = 'There Are Some Bad People Out There'
    @card_type = 'Pledge'
    @cost = 0
    @text = "Gain 2 VOTERS and put a RUMOUR on top of a player's deck"
  end

  def effect
    target(opponent)
    current_player.gain_voters(2)
    @targets.each(&:gain_rumour)
  end
end
