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

  it 'can reduce the number of voters in the pool' do
    game.reduce_voter_pool(5)
    expect(game.return_voter_pool).to eq 40
  end

  it 'cannot reduce the number of voters below zero' do
    game.reduce_voter_pool(100)
    expect(game.return_voter_pool).to eq 0
  end

  it 'can return a remainder value once the pool is emptied' do
    expect(game.reduce_voter_pool(50)).to eq 5
  end

  it 'can reorder the player array based on voter count' do
    p1.gain_voters(5)
    p2.gain_voters(10)
    p3.gain_voters(2)
    game.sort_order
    expect(game.return_players.first).to eq p2
  end

  it 'can cycle through player turns' do
    expect(game.current_player).to eq p1
    game.switch_turns
    expect(game.current_player).to eq p2
    game.switch_turns
    expect(game.current_player).to eq p3
  end
end
