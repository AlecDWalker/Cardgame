# frozen_string_literal: true

require_relative 'player'
require_relative 'card'

class Turn
  def initialize(player)
    @player = player
    @player.draw_card(1) while @player.hand.count < 5
    @player.trigger_advisors
    @actions_left = 3
  end

  def return_actions
    @actions_left
  end

  def decrease_actions
    @actions_left -= 1
  end

  def new_hand
    if @actions_left == 3
      @player.hand.each { |card| @player.deck.add_card(card) }
      @player.hand.clear
      @player.draw_card(5)
      3.times{self.decrease_actions}
    else
      "You can't cycle your hand after playing a card!"
    end
  end
end
