require 'pile'

describe Pile do
  it "can offer cards" do
    pile = Pile.new(["A","B","C"])

    pile.draw(2).should match_array(["A","B"])
  end
end
