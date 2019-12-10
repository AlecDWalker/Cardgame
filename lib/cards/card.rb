class Card

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
  
end
