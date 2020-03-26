# frozen_string_literal: true

require './card.rb'

class P01 < Pledge
  def initialize
    @title = 'I Will Kiss Your Baby'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Put each remaining card in your hand on the bottom of your deck in any order. Gain 1 VOTER for each card put there this way'
  end

  def choose_order(array)
    #This method still needs to be created. Better in another class?
  end

  def effect
    reorder_array = []
    current_player.return_hand.count = value
    currrent_player.hand.each do
      reorder_array << self
    end
    reorder_array.choose_order
    reorder_array.each do
      self.resolve(current_player)
    end
    current_player.gain_voters(value-1)
  end
end
