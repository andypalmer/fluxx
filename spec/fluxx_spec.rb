class Hand
  def initialize(cards)
    @cards = cards
  end

  def play(amount, cards)
    @cards.pop amount
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
    hand.play 1, hand
    
    hand.contents.should match_array(["A", "B"])
  end

  it "draws two" do
    drawpile = initial_drawpile
    hand = initial_hand(drawpile)
    hand.add drawpile.draw(2)
    
    hand.contents.should match_array(["A", "B", "C", "X", "Y"])
  end

  it "plays two" do
    drawpile = initial_drawpile
    hand = initial_hand(drawpile)
    hand.play 2, hand

    hand.contents.should match_array(["A"])
  end
end

