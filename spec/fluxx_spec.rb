
def draw(amount, cards)
  cards += amount
end

def play_one_of(cards)
  cards -= 1
end

def initial_hand
  3
end

describe "rules" do
  it "draws one" do
    cards_in_hand = initial_hand
    cards_in_hand = draw 1, cards_in_hand
    cards_in_hand.should eq 4
  end

  it "plays one" do
    cards_in_hand = 4
    cards_in_hand = play_one_of cards_in_hand
    cards_in_hand.should eq 3
  end

  it "draws two" do
    cards_in_hand = initial_hand
    cards_in_hand = draw 2, cards_in_hand
    
    cards_in_hand.should eq 5
  end
end

