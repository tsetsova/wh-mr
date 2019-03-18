class Navigation

  DIRECTIONS = { N: {left: :W, right: :E},
                 W: {left: :S, right: :N},
                 S: {left: :E, right: :W},
                 E: {left: :N, right: :S}
  }

  def initialize(map_size:)
    @width = map_size[:width]
    @height = map_size[:height]
  end

  def move_rover_forward(facing:, coordinates: )
    new_coordinates = calculate_new_coordinates(facing: facing, coordinates: coordinates )
    return new_coordinates if !over_the_edge?(new_coordinates[:x], new_coordinates[:y])

    coordinates[:lost] = true
    return coordinates
  end

  def orientate(current_direction, action)
    DIRECTIONS[current_direction][action]
  end

  private

  def over_the_edge?(x, y)
    x > @width || x < 0 || y > @height || y < 0
  end

  def calculate_new_coordinates(facing:, coordinates: )
    if facing == :N
      { x: coordinates[:x], y: coordinates[:y] + 1, lost: false}
    elsif facing == :S
      { x: coordinates[:x], y: coordinates[:y] - 1, lost: false}
    elsif facing == :E
      { x: coordinates[:x] + 1 , y: coordinates[:y], lost: false}
    else
      { x: coordinates[:x] - 1 , y: coordinates[:y], lost: false}
    end
  end
end
