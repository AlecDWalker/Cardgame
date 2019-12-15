require 'draft'
require 'card'

describe Draft do
  let(:c1) { Card.new('Card1', 'Pledge', 1, 'Text goes here') }
  let(:c2) { Card.new('Card2', 'Smear', 1, 'Text goes here') }
  let(:p1) { Player.new('Alec') }
  let(:p2) { Player.new('Dave') }
  let(:p3) { Player.new('Holly') }
  let(:cardpool) {[c1, c1, c1, c2]}
  let(:player_array) {[p1, p2, p3]}

  it 'can initialize with a selection array of 3 cards' do
    draft = Draft.new(cardpool, player_array)
    expect(draft.return_selection).to eq [c1, c1, c1]
  end

end
