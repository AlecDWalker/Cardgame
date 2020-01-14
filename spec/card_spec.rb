# frozen_string_literal: true

require 'card'

describe Card do
  it 'can return its key details' do
    card = Card.new('Testname', 'Pledge', 1, 'This is where the card text goes')
    expect(card.return_title).to eq 'Testname'
    expect(card.return_type).to eq 'Pledge'
    expect(card.return_cost).to eq 1
    expect(card.return_text).to eq 'This is where the card text goes'
  end

  it 'can target a sigle player' do
    player = Player.new('Alec')
    card = Card.new('Testname', 'Pledge', 1, 'This is where the card text goes')
    card.target(player)
    expect(card.return_target).to eq player
  end

  it 'erases the previous target after being played' do
    player = Player.new('Alec')
    card = Card.new('Testname', 'Pledge', 1, 'This is where the card text goes')
    card.target(player)
    card.resolve(player)
    expect(card.return_target).to eq nil
  end
end
