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

  def move(card, to)
    @cards.delete card
    @cards.insert(to.position_within(@cards), card)
  end
end

class To
  def To.after(card)
    return To.new(card, 1)
  end

  def To.before(card)
    return To.new(card, 0)
  end

  def initialize(card, relative_position)
    @card = card
    @relative_position = relative_position
  end

  def position_within(cards)
    cards.index(@card) + @relative_position
  end

end
