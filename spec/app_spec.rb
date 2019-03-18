require 'app'
require 'rover'
require 'navigation'

describe App do
  before(:each) do
    @app = described_class.new(map_size: {width: 4, height: 8})
    @app.place_rover(coordinates:{x:2, y: 3},  direction: :N )
  end

  it "commands a rover succesfully" do
    expect(@app.run([:F, :L, :L, :F, :R])).to eq "(2, 3, W)"
  end

  it "receives last coordinates of a lost rover over west border" do
    expect(@app.run([:F, :F, :L, :F, :F, :F, :F, :R, :F])).to eq "(0, 5, W) LOST"
  end

  it "receives last coordinates of a lost rover over east border" do
    expect(@app.run([:F, :R, :F, :L, :F, :R, :F, :F])).to eq "(4, 5, E) LOST"
  end

  it "receives last coordinates of a lost rover over south border" do
    expect(@app.run([:R, :R, :F, :F, :F, :F])).to eq "(2, 0, S) LOST"
  end

  it "receives last coordinates of a lost rover over south border" do
    expect(@app.run([:R, :R, :F, :F, :F, :F])).to eq "(2, 0, S) LOST"
  end

  it "receives last coordinates of a lost rover over north border" do
    expect(@app.run([:F, :F, :F, :F, :F, :R, :F, :F, :L, :F])).to eq "(4, 8, N) LOST"
  end
end
