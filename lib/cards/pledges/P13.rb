# frozen_string_literal: true

require './card.rb'

class P13 < Pledge
  def initialize
    @title = 'Throw Notes Over Shoulder'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Put your hand on the bottom of your deck in any order, then draw 5 cards'
  end

  def choose_order(array); end

  def effect
    reorder_array = []
    current_player.hand.each do |card|
      reorder_array << card
    end
    choose_order(reorder_array)
    reorder_array.each do |card|
      current_player.deck.cards << card
    end
    reorder_array.clear
    current_player.draw_card(5)
  end
end
