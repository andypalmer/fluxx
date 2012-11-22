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

class CardPile
  def initialize(cards)
    @cards = cards
  end

  def draw(amount)
    @cards.shift(amount)
  end
end

def initial_hand(drawpile)
  Hand.new(drawpile.draw(3))
end

def initial_drawpile
  CardPile.new(["A", "B", "C", "X", "Y", "Z"])
end

describe "rules" do
  it "draws one" do
    drawpile = initial_drawpile
    hand = initial_hand(drawpile)
    hand.add drawpile.draw(1)

    hand.contents.should match_array(["A", "B", "C", "X"])
  end

  it "plays one" do
    drawpile = initial_drawpile
    hand = initial_hand(drawpile)
    hand.play "B"
    
    hand.contents.should match_array(["A", "C"])
  end

  it "draws two" do
    drawpile = initial_drawpile
    hand = initial_hand(drawpile)
    hand.add drawpile.draw(2)
    
    hand.contents.should match_array(["A", "B", "C", "X", "Y"])
  end
end

