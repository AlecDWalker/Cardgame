class Game

  def initialize(player_array)
    @players = []
    player_array.each { |n|
      @players << n
    }
    @voter_pool = 15*(player_array.count)
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
    @players.sort_by!{ |player| -player.voter_count}
  end

  def current_turn
    @current_turn
  end

  def switch_turns
    @current_turn = opponent_of(@current_turn)
  end

  def opponent_of(the_player)
    @players.select {|player| player != the_player}.first
  end


end
