
def draw(amount, cards)
  cards += amount
end

def play(amount, cards)
  cards -= amount
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
    cards_in_hand = initial_hand
    cards_in_hand = play 1, cards_in_hand
    
    cards_in_hand.should eq 2 
  end

  it "draws two" do
    cards_in_hand = initial_hand
    cards_in_hand = draw 2, cards_in_hand
    
    cards_in_hand.should eq 5
  end

  it "plays two" do
    cards_in_hand = initial_hand
    cards_in_hand = play 2, cards_in_hand

    cards_in_hand.should eq 1
  end
end

