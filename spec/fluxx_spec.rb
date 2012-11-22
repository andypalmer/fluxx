
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
  ["A", "B", "C"]
end

def initial_drawpile
  ["X", "Y", "Z"]
end

describe "rules" do
  it "draws one" do
    cards_in_hand = Hand.new(initial_hand)
    cards_in_hand.add draw(1, initial_drawpile)

    cards_in_hand.contents.should match_array(["A", "B", "C", "X"])
  end

  it "plays one" do
    cards_in_hand = Hand.new(initial_hand)
    cards_in_hand.play 1, cards_in_hand
    
    cards_in_hand.contents.should match_array(["A", "B"])
  end

  it "draws two" do
    cards_in_hand = Hand.new(initial_hand)
    cards_in_hand.add draw(2, initial_drawpile)
    
    cards_in_hand.contents.should match_array(["A", "B", "C", "X", "Y"])
  end

  it "plays two" do
    cards_in_hand = Hand.new(initial_hand)
    cards_in_hand.play 2, cards_in_hand

    cards_in_hand.contents.should match_array(["A"])
  end
end

