# frozen_string_literal: true

require 'player'
require 'card'
require 'deck'

describe Rumour do
  let(:player) { Player.new('Alec') }
  let(:card) { Card.new('Testname', 'Pledge', 1, 'This is where the card text goes') }
  let(:rumour) { Rumour.new('Rumour', 'rumour', 0, 'This is a rumour card') }

  it 'can play a rumour from their hand and delete it' do
    player.deck.add_card(rumour)
    player.deck.add_card(card)
    player.draw_card(1)
    player.play(rumour)
    expect(player.return_hand).to be_empty
    expect(player.deck_count).to eq [card]
  end
end
