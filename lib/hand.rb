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

  def move(card, relative_to)
    @cards.delete card
    @cards.insert(relative_to.the(@cards), card)
  end
end
