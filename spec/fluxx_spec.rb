
def draw(amount, drawpile)
  drawpile.shift amount
end

def play(amount, cards)
  cards.pop amount
  cards
end

def initial_hand
  ["A", "B", "C"]
end

def initial_drawpile
  ["X", "Y", "Z"]
end

describe "rules" do
  it "draws one" do
    cards_in_hand = initial_hand
    cards_in_hand += draw(1, initial_drawpile)

    cards_in_hand.should match_array(["A", "B", "C", "X"])
  end

  it "plays one" do
    cards_in_hand = initial_hand
    cards_in_hand = play 1, cards_in_hand
    
    cards_in_hand.should match_array(["A", "B"])
  end

  it "draws two" do
    cards_in_hand = initial_hand
    cards_in_hand += draw(2, initial_drawpile)
    
    cards_in_hand.should match_array(["A", "B", "C", "X", "Y"])
  end

  it "plays two" do
    cards_in_hand = initial_hand
    cards_in_hand = play 2, cards_in_hand

    cards_in_hand.should match_array(["A"])
  end
end

