
describe "rules" do
  it "draws one" do
    cards_in_hand = 3
    cards_in_hand += 1
    cards_in_hand.should eq 4
  end

  it "plays one" do
    cards_in_hand = 4
    cards_in_hand -= 1
    cards_in_hand.should eq 3
  end
end

