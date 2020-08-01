# frozen_string_literal: true

require_relative 'player'
require_relative 'draft'
require_relative 'campaign'

class Game
  def initialize
    @player_array = []
    @cardpool = []
  end

  def return_players
    @player_array
  end

  def add_player(player)
    @player_array << Player.new(player)
  end

  def create_draft
    Draft.new(@cardpool, @player_array)
  end

  def create_campaign
    Campaign.new(@player_array)
  end
end
