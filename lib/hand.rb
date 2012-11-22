class Hand
  def initialize(cards)
    @cards = cards
  end

  def play(card)
    @cards.delete card
  end

  def add(cards)
    @cards += cards
  end

  def contents
    Array.new @cards
  end
end
