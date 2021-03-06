# frozen_string_literal: true

require 'player'
require 'card'
require 'deck'

describe Player do
  let(:player) { Player.new('Alec') }
  let(:opponent) { Player.new('Dave') }
  let(:card) { Card.new('Testname', 'Pledge', 1, 'This is where the card text goes') }
  let(:rumour) { Rumour.new('Rumour', 'Rumour', 0, 'This is a rumour card') }

  it 'initializes as a blank slate' do
    expect(player.return_name).to eq 'Alec'
    expect(player.voter_count).to eq 0
    expect(player.influence_count).to eq 0
    expect(player.deck_count).to be_empty
  end

  describe 'voters' do
    it 'can gain voters' do
      player.gain_voters(3)
      expect(player.voter_count).to eq 3
    end

    it 'can lose voters' do
      player.gain_voters(5)
      player.lose_voters(4)
      expect(player.voter_count).to eq 1
    end

    it 'can steal_voters' do
      opponent.gain_voters(10)
      player.steal_voters(opponent, 6)
      expect(player.voter_count).to eq 6
      expect(opponent.voter_count).to eq 4
    end

    it 'can lock voters' do
      player.gain_voters(5)
      player.lock_voters(3)
      expect(player.voter_count).to eq 5
      expect(player.unlocked_voter_count).to eq 2
    end

    it 'cannot lock non-existant voters' do
      player.gain_voters(5)
      player.lock_voters(7)
      expect(player.voter_count).to eq 5
      expect(player.unlocked_voter_count).to eq 0
    end

    it 'cannot steal locked voters' do
      opponent.gain_voters(5)
      opponent.lock_voters(5)
      player.steal_voters(opponent, 5)
      expect(opponent.voter_count).to eq 5
      expect(player.voter_count).to eq 0
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

  describe 'deck interaction' do
    before do
      player.deck.add_card(card)
      player.deck.add_card(rumour)
      player.draw_card(1)
    end

    it 'can add a card from the top of their deck to their hand' do
      expect(player.return_hand).to eq [card]
      expect(player.deck_count).to eq [rumour]
    end

    it 'can put a card from their hand to the bottom of the deck' do
      player.play(card)
      expect(player.return_hand).to be_empty
      expect(player.deck_count).to eq [rumour, card]
    end
  end
end
