# frozen_string_literal: true
require_relative 'deck'
require_relative 'player'
class Card
  attr_reader :title, :type, :cost, :text
  def initialize(title, type, cost, text)
    @title = title
    @type = type
    @cost = cost
    @text = text
  end

  def return_title
    @title
  end

  def return_type
    @type
  end

  def return_cost
    @cost
  end

  def return_text
    @text
  end

  def resolve(player)
    player.deck.cards << self
  end

  def effect; end
end

class Rumour < Card
  def resolve(player)
    'Rumour quashed'
  end
end

class Advisor < Card
  def effect
    'Advisor triggers'
  end

  def resolve(player)
    player.advisors << self
  end
end
