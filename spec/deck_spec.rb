# frozen_string_literal: true

require 'deck'
require 'cards/card'

describe Deck do
  let(:deck) { Deck.new }
  let(:c1) { Card.new('Card1', 'Pledge', 1, 'Text goes here') }
  let(:c2) { Card.new('Card2', 'Advisor', 1, 'Text goes here') }

  it 'lets the player add cards to the bottom of the deck' do
    deck.add_card(c1)
    deck.add_card(c2)
    expect(deck.return_cards).to eq [c1, c2]
  end

  it 'lets the player remove cards from the top of the deck' do
    deck.add_card(c1)
    deck.add_card(c2)
    deck.draw_card
    expect(deck.return_cards).to eq [c2]
  end
  
end
