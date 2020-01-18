# frozen_string_literal: true

class AllCards
  def initialize
    @library = []
  end

  def random_sample(number_of_players)
    @library.sample(number_of_players * 15)
  end
end
