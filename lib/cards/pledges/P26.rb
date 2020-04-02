# frozen_string_literal: true

require './card.rb'

class P26 < Pledge
  def initialize
    @title = 'Listen Up, I Hate Bears, OK?'
    @card_type = 'Pledge'
    @cost = 1
    @text = 'Spin the Spinner twice!'
  end

  def effect
    2.times do
      current_player.spin
    end
  end

end
