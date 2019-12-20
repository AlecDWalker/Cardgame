# frozen_string_literal: true

require 'draft'
require 'card'

describe Draft do
  let(:c1) { Card.new('Card1', 'Pledge', 1, 'Text goes here') }
  let(:c2) { Card.new('Card2', 'Smear', 1, 'Text goes here') }
  let(:p1) { Player.new('Alec') }
  let(:p2) { Player.new('Dave') }
  let(:p3) { Player.new('Holly') }
  let(:cardpool) { [c1, c1, c1, c2] }
  let(:player_array) { [p1, p2, p3] }
  let(:draft) { Draft.new(cardpool, player_array) }

  it 'can initialize with a selection array of 3 cards' do
    expect(draft.return_selection).to eq [c1, c1, c1]
  end

  it 'can have a player choose one of the cards' do
    expect(draft.choose(1)).to eq [c1]
    expect(draft.return_selection).to eq [c2, c1, c1]
  end

  it 'adds the chosen card to that players deck' do
    draft.choose(1)
    expect(draft.current_player.deck_count).to eq [c1]
  end

  it 'displays who is currently picking a card' do
    expect(draft.current_player).to eq p1
  end

  it 'can cycle through the player array' do
    draft.rotate
    expect(draft.current_player).to eq p2
  end

  it 'returns to the start of the player array once all have chosen' do
    3.times { draft.rotate }
    expect(draft.current_player).to eq p1
  end

  it 'returns a message once the last card has been picked' do
    4.times { draft.choose(1) }
    expect(draft.return_selection).to eq 'All cards drafted, let the game begin!'
  end
end
