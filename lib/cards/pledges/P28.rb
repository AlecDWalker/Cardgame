# frozen_string_literal: true

require './card.rb'

class P28 < Pledge
  def initialize
    @title = 'I Don;t Need Advice'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'If you have no ADVISORS in play, gain 1 VOTER for each ADVISOR other players own in play'
  end

  def effect
    if current_player.advisors.empty?
      count = 0
      game.player_array.except(current_player).each do |player|
        count += player.advisors.count
      end
      current_player.gain_voters(count)
    end
  end
end
