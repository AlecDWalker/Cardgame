# frozen_string_literal: true

require 'player'

describe Player do
  let(:player) { Player.new('Alec') }

  it 'initializes as a blank slate' do
    expect(player.return_name).to eq 'Alec'
    expect(player.voter_count).to eq 0
    expect(player.influence_count).to eq 0
    expect(player.deck_count).to be_empty
  end

  describe 'voters' do
    it 'can gain voters' do
      player.add_voters(3)
      expect(player.voter_count).to eq 3
    end

    it 'can lose voters' do
      player.add_voters(5)
      player.lose_voters(4)
      expect(player.voter_count).to eq 1
    end

    it 'cannot have a negative voter count' do
      player.lose_voters(6)
      expect(player.voter_count).to eq 0
    end
  end

  describe 'influence' do
    it 'can gain influence' do
      player.add_influence(3)
      expect(player.influence_count).to eq 3
    end

    it 'can lose influence' do
      player.add_influence(5)
      player.lose_influence(4)
      expect(player.influence_count).to eq 1
    end

    it 'cannot have a negative influence count' do
      player.lose_influence(6)
      expect(player.influence_count).to eq 0
    end
  end
end
