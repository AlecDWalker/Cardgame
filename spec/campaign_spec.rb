# frozen_string_literal: true

require 'campaign'

describe Campaign do
  let(:p1) { Player.new('Alec') }
  let(:p2) { Player.new('Dave') }
  let(:p3) { Player.new('Holly') }
  let(:player_array) { [p1, p2, p3] }
  let(:campaign) { Campaign.new(player_array) }

  it 'starts with a voter pool equal to 15 times the number of players' do
    expect(campaign.return_voter_pool).to eq 45
  end

  it 'can reduce the number of voters in the pool' do
    campaign.reduce_voter_pool(5)
    expect(campaign.return_voter_pool).to eq 40
  end

  it 'cannot reduce the number of voters below zero' do
    campaign.reduce_voter_pool(100)
    expect(campaign.return_voter_pool).to eq 0
  end

  it 'can return a remainder value once the pool is emptied' do
    expect(campaign.reduce_voter_pool(50)).to eq 5
  end

  it 'can reorder the player array based on voter count' do
    p1.gain_voters(5)
    p2.gain_voters(10)
    p3.gain_voters(2)
    campaign.sort_order
    expect(campaign.return_players.first).to eq p2
  end

  it 'can cycle through player turns' do
    expect(campaign.current_player).to eq p1
    campaign.switch_turns
    expect(campaign.current_player).to eq p2
    campaign.switch_turns
    expect(campaign.current_player).to eq p3
  end
end
