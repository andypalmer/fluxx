require 'hand'

def initial_hand
  Hand.new(["A","B","C"])
end

describe Hand do
  it "can accept a card" do
    hand = initial_hand
    hand.add ["X"]

    hand.contents.should match_array(["A", "B", "C", "X"])
  end

  it "can play a specific card" do
    hand = initial_hand
    hand.play "B"
    
    hand.contents.should match_array(["A", "C"])
  end

  it "can accept two cards" do
    hand = initial_hand
    hand.add ["X","Y"]
    
    hand.contents.should match_array(["A", "B", "C", "X", "Y"])
  end
end

