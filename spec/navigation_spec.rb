require 'navigation'

describe Navigation do
  let(:navigation) { described_class.new(map_size: {width: 3, height: 4})}

  it "updates coordinates succesfully on the y axis" do
    new_coordinates = navigation.move_rover_forward(facing: :N, coordinates: {x: 1, y: 2})
    expect(new_coordinates).to eq({x: 1, y: 3, lost: false})
  end

  it "updates coordinates succesfully on the x axis" do
    new_coordinates = navigation.move_rover_forward(facing: :E, coordinates: {x: 1, y: 2})
    expect(new_coordinates).to eq({x: 2, y: 2, lost: false})
  end

  it "orientates correctly" do
    expect(navigation.orientate(:N, :left)).to eq :W
    expect(navigation.orientate(:S, :right)).to eq :W
  end

  context "Lost" do
    it "knows it's lost if x exceeds the width of the map" do
      new_coordinates = navigation.move_rover_forward(facing: :E, coordinates: {x: 3, y: 4})
      expect(new_coordinates).to eq({x:3, y: 4, lost: true})
    end

    it "knows it's lost if y exceeds the width of the map" do
      new_coordinates = navigation.move_rover_forward(facing: :N, coordinates: {x: 3, y: 4})
      expect(new_coordinates).to eq({x:3, y: 4, lost: true})
    end

    it "knows it's lost if x is less than 0" do
      new_coordinates = navigation.move_rover_forward(facing: :W, coordinates: {x: 0, y: 4})
      expect(new_coordinates).to eq({x:0, y: 4, lost: true})
    end

    it "knows it's lost if x is less than 0" do
      new_coordinates = navigation.move_rover_forward(facing: :S, coordinates: {x: 1, y: 0})
      expect(new_coordinates).to eq({x:1, y: 0, lost: true})
    end
  end
end
