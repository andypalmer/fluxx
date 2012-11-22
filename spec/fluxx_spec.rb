
def draw_one_into(cards)
  cards += 1
end

def play_one_of(cards)
  cards -= 1
end

describe "rules" do
  it "draws one" do
    cards_in_hand = 3
    cards_in_hand = draw_one_into(cards_in_hand)
    cards_in_hand.should eq 4
  end

  it "plays one" do
    cards_in_hand = 4
    cards_in_hand = play_one_of(cards_in_hand)
    cards_in_hand.should eq 3
  end
end

