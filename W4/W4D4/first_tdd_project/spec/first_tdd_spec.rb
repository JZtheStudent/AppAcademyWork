require "rspec"
require "first_tdd"
require "set"

describe "#my_uniq" do
  it "should take in an array as an argument" do
      my_uniq([1, 2, 1, 3, 3])
  end
  
  it "returns an array of unique elements" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end
end

describe Array do
  describe "#two_sum" do
    it "return a 2D array of elements that add up to zero" do
      expect([-1, 0, 2, -2, 1].two_sum.to_set).to eq([[0, 4], [2, 3]].to_set)
    end
  end

  describe "#my_transpose" do
    let(:rows1) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ] }
    let(:rows2) { [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ] }

    it "returns the transposed 2D array" do
      expect(rows1.my_transpose).to eq(rows2)
    end
  end
  
  describe "#stock_picker" do
    it "returns the pair of sell day indices for the max profit" do
      expect( [1, 2, 9, 4, 30].stock_picker).to eq([0, 4])
    end
  end
      
end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  let(:tower_begin) { [ ["1", "2", "3", "4", "5"], [nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil] ] }
  let(:tower_end) { [[nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil], ["1", "2", "3", "4", "5"] ] } 
  
  it "should initialize with a 2D array of towers" do
    expect(game.towers).to eq(tower_begin)
  end
  
  describe "#move" do
    it "should remove the top element of the first tower and add it to the top of the second tower. Then return the second tower" do
      game.move(0, 1)
      expect(game.towers[1]).to eq([nil, nil, nil, nil, "1"])
    end
  end
  
  describe "#won?" do
    it "should return true if stack 2 is in order else it returns false" do
      game.instance_variable_set(:@towers, tower_end)
      expect(game.won?).to eq(true)
    end
  end

end

# battleship.instance_variable_set(:@remaining_misses, -1)