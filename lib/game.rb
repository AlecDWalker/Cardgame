# frozen_string_literal: true

class Game
  def initialize(player_array)
    @players = player_array
    @voter_pool = 15 * player_array.count
    @game_over = false
    @current_turn = 0
  end

  def return_voter_pool
    @voter_pool
  end

  def return_players
    @players
  end

  def current_turn
    @current_turn
  end

  def sort_order
    @players.sort_by! { |player| -player.voter_count }
  end

  def switch_turns
    if @current_turn < @players.count - 1
      @current_turn += 1
    else
      @current_turn = 0
    end
  end

  def current_player
    @players[@current_turn]
  end

end
