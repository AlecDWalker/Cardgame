# frozen_string_literal: true

require './card.rb'

class P27 < Pledge
  def initialize
    @title = 'I Mean, Who Knows?'
    @card_type = 'Pledge'
    @cost = 2
    @text = 'Spin the Spinner three times!'
  end

  def effect
    3.times do
      current_player.spin
    end
  end

end
