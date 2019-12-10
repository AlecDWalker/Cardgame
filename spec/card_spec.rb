require 'cards/card'

describe Card do

  it "can return its key details" do
    card = Card.new('Testname', 'Pledge', 1, 'This is where the card text goes')
    expect(card.return_title).to eq 'Testname'
    expect(card.return_type).to eq 'Pledge'
    expect(card.return_cost).to eq 1
    expect(card.return_text).to eq 'This is where the card text goes'
  end

end
