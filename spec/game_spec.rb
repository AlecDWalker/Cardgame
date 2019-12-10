require 'game'

describe Game do
  let(:p1) {Player.new('Alec')}
  let(:p2) {Player.new('Dave')}
  let(:p3) {Player.new('Holly')}

  it 'starts with a voter pool equal to 15 times the number of players' do
    player_array = [p1, p2, p3]
    game = Game.new(player_array)
    expect(game.return_voter_pool).to eq 45
  end
end
