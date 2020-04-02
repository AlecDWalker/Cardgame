# frozen_string_literal: true

require './card.rb'

class P10 < Pledge
  def initialize
    @title = 'Pluto is a Planet'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Spin the Spinner!'
  end

  def effect
    current_player.spin
  end
end
