# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }
  before do
    game.add_player('Alec')
    game.add_player('Dave')
  end

  it 'can add players to the player array' do
    expect(game.return_players[0].return_name).to eq 'Alec'
    expect(game.return_players[1].return_name).to eq 'Dave'
  end

  it 'can create a new draft with the player array' do
    draft = game.create_draft
    expect(draft).instance_of? Draft
    expect(draft.return_players[0].return_name).to eq 'Alec'
    expect(draft.return_players[1].return_name).to eq 'Dave'
  end
end
