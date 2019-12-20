require 'start'

describe Start do
  let(:start) {Start.new}
  before do
  start.add_player('Alec')
  start.add_player('Dave')
  end

  it 'can add players to the player array' do
    expect(start.return_players[0].return_name).to eq 'Alec'
    expect(start.return_players[1].return_name).to eq 'Dave'
  end

  it 'can create a new draft with the player array' do
    draft = start.create_draft
    expect(draft).instance_of? Draft
    expect(start.return_players[0].return_name).to eq 'Alec'
    expect(start.return_players[1].return_name).to eq 'Dave'
  end
end
