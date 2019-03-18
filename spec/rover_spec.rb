require 'rover'
require 'navigation'

describe Rover do
  let(:rover) { described_class.new(coordinates: { x:1, y:2 }, direction:'N', navigation: Navigation.new(map_size: {width: 4, height: 6})) }

  it "formats its status correctly" do
    3.times{ rover.move_forward }
    expect(rover.status).to eq "(1, 5, N)"
  end

  it "formats it's last coordinates before getting lost" do
    5.times{ rover.move_forward }
    expect(rover.status).to eq "(1, 6, N) LOST"
  end

  it "can turn left" do
    rover.turn_left
    expect(rover.status).to eq "(1, 2, W)"
  end

  it "can turn right" do
    rover.turn_right
    expect(rover.status).to eq "(1, 2, E)"
  end
end
