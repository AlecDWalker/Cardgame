require './card.rb'

class ILikeSteadyGrowth < Pledge
  def initialize
    @title = "I like steady growth"
    @card_type = "Pledge"
    @cost = 1
    @text = "Gain 3 VOTERS and 2 INFLUENCE"
  end

  def @return_cost
    @cost
  end

  def effect
    current_player.gain_voters(3)
    current_player.add_influence(2)
  end

end