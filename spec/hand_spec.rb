require 'hand'

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

  def the(cards)
    cards.index(@card) + @relative_position
  end

end

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

  it "can be rearranged" do
    hand = Hand.new(["A","B","C","D","E"])

    hand.move("B", To.after("D"))
    hand.contents.should eq(["A","C","D","B","E"])

    hand.move("E", To.before("C"))
    hand.contents.should eq(["A","E","C","D","B"])
  end
end

