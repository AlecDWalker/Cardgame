require 'card'
require 'player'
require 'deck'

describe Advisor do
  let(:player) { Player.new('Alec') }
  let(:advisor) { Advisor.new('A very cute dog', 'Advisor', 0, 'Awww, look at his little face') }

  it 'can trigger advisor effects when played' do
    expect(advisor.effect).to eq 'Advisor triggers'
  end

  it 'can add advisor cards to the advisors array' do
    player.play(advisor)
    expect(player.return_advisors).to eq [advisor]
  end

  it 'can trigger advisor effects on subsequent occasions' do
    player.play(advisor)
    expect(player.trigger_advisors).to eq 'Advisor triggers'
  end
end
