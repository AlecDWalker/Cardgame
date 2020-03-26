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

  attr_reader :current_turn

  def sort_order
    @players.sort_by! { |player| -player.voter_count }
  end

  def reduce_voter_pool(n)
    remainder = 0
    n.times do
      if @voter_pool.positive?
        @voter_pool -= 1
      else
        remainder += 1
      end
    end
    return remainder if remainder.positive?
  end

  def increase_voter_pool(n)
    @voter_pool += n
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
