class Game

  def initialize(player_array)
    @players = []
    player_array.each { |n|
      @players << n
    }
    @voter_pool = 15*(player_array.count)
  end

  def return_voter_pool
    @voter_pool
  end

end
