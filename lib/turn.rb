# frozen_string_literal: true

require_relative 'player'
require_relative 'card'

class Turn
  def initialize(player)
    @player = player
    @player.draw_card(1) while @player.hand.count < 5
    @player.trigger_advisors
    @actions = 0
  end

  def return_actions
    @actions
  end

  def increase_actions
    @actions += 1
  end

  def new_hand
    if @actions == 0
      @player.hand.each { |card| @player.deck.add_card(card) }
      @player.hand.clear
      @player.draw_card(5)
      @actions += 3
    else
      "You can't cycle your hand after playing a card!"
    end
  end
end
