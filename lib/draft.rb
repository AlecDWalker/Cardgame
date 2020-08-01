# frozen_string_literal: true

require_relative 'player'
require_relative 'cards/allcards'

class Draft
  def initialize(cardpool, player_array)
    @cardpool = cardpool
    @player_array = player_array
    @selection = []
    @chooser = 0
    @draft_complete = false
    3.times { deal(0) }
  end

  def return_players
    @player_array
  end

  def deal(n)
    @selection.insert(n, @cardpool.shift) if @cardpool.any?
  end

  def return_selection
    if @selection.any?
      @selection
    else
      @draft_complete = true
      'All cards drafted, let the game begin!'
    end
  end

  def choose(n)
    deal(n)
    current_player.deck.add_card(@selection.slice!(n - 1))
  end

  def current_player
    @player_array[@chooser]
  end

  def rotate
    if @chooser < @player_array.count - 1
      @chooser += 1
    else
      @chooser = 0
    end
  end
end
