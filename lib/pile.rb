class Pile
  def initialize(cards)
    @cards = cards
  end

  def draw(amount)
    @cards.shift(amount)
  end
end
