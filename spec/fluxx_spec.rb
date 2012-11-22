
def draw(amount, drawpile)
  drawpile.shift amount
end

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

def initial_hand
  Hand.new(["A", "B", "C"])
end

def initial_drawpile
  ["X", "Y", "Z"]
end

describe "rules" do
  it "draws one" do
    hand = initial_hand
    hand.add draw(1, initial_drawpile)

    hand.contents.should match_array(["A", "B", "C", "X"])
  end

  it "plays one" do
    hand = initial_hand
    hand.play 1, hand
    
    hand.contents.should match_array(["A", "B"])
  end

  it "draws two" do
    hand = initial_hand
    hand.add draw(2, initial_drawpile)
    
    hand.contents.should match_array(["A", "B", "C", "X", "Y"])
  end

  it "plays two" do
    hand = initial_hand
    hand.play 2, hand

    hand.contents.should match_array(["A"])
  end
end

