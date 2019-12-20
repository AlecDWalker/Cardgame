require 'start'

describe Start do
  let(:start) {Start.new}

  it 'can add players to the player array' do
    start.add_player('Alec')
    start.add_player('Dave')
    expect(start.return_players[0].return_name).to eq 'Alec'
    expect(start.return_players[1].return_name).to eq 'Dave'
  end

  it 'can create a new draft from the player array' do
    start.add_player('Alec')
    start.add_player('Dave')
    expect(start.create_draft).instance_of? Draft
  end
end
