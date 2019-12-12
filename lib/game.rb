# frozen_string_literal: true

class Game
  def initialize(player_array)
    @players = []
    player_array.each do |n|
      @players << n
    end
    @voter_pool = 15 * player_array.count
    @game_over = false
    @current_turn = @players.first
  end

  def return_voter_pool
    @voter_pool
  end

  def return_players
    @players
  end

  def sort_order
    @players.sort_by! { |player| -player.voter_count }
  end

  attr_reader :current_turn

  def switch_turns
    @current_turn = opponent_of(@current_turn)
  end

  def opponent_of(the_player)
    @players.reject { |player| player == the_player }.first
  end
end
