# frozen_string_literal: true

require './card.rb'

class P12 < Pledge
  def initialize
    @title = "It's All Lies"
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Remove all RUMOURS from your hand and gain 2 VOTERS for each RUMOUR removied this way'
  end

  def effect
    rum = 0
    current_player.hand.each { |card|
      if card.is_a? Rumour
        rum += 1
        card.delete
      end
    }
    end
    current_player.gain_voters((rum * 2))
  end
end
