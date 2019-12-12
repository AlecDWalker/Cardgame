# frozen_string_literal: true

require 'game'

describe Game do
  let(:p1) { Player.new('Alec') }
  let(:p2) { Player.new('Dave') }
  let(:p3) { Player.new('Holly') }
  let(:player_array) { [p1, p2, p3] }
  let(:game) { Game.new(player_array) }

  it 'starts with a voter pool equal to 15 times the number of players' do
    expect(game.return_voter_pool).to eq 45
  end

  it 'can reorder player turns based on voter count' do
    p1.add_voters(5)
    p2.add_voters(10)
    p3.add_voters(2)
    game.sort_order
    expect(game.return_players.first).to eq p2
  end
end
