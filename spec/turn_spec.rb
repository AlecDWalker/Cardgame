# frozen_string_literal: true

require 'turn'

describe Turn do
  let(:alec) { Player.new('Alec') }
  let(:turn) { Turn.new(alec) }
  let(:card) { Card.new('Testname', 'Pledge', 1, 'This is where the card text goes') }
  let(:rumour) { Rumour.new('Rumour', 'Rumour', 0, 'This is a rumour card') }

  it 'can decrease the action counter' do
    turn.decrease_actions
    expect(turn.return_actions).to eq 2
  end

  describe 'cycle hand' do
    it 'cannot cycle hand if a card has been played' do
      turn.decrease_actions
      expect(turn.new_hand).to eq "You can't cycle your hand after playing a card!"
    end
    it 'can cycle a hand if the actions value is 3' do
      alec.hand = [card, card, card, card, card, card]
      alec.deck.cards = [rumour, rumour, rumour, rumour]
      turn.new_hand
      expect(alec.return_hand).to eq [rumour, rumour, rumour, rumour, card]
      expect(alec.deck_count).to eq [card, card, card, card, card]
      expect(turn.return_actions).to eq 0
    end
  end
end
