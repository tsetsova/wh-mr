require_relative "navigation"

class Rover
  def initialize(coordinates:, direction:, navigation:)
    @coordinates = coordinates
    @direction = direction.to_sym
    @navigation = navigation
  end

  def turn_left
    @direction = @navigation.orientate(@direction, :left)
  end

  def turn_right
    @direction = @navigation.orientate(@direction, :right)
  end

  def move_forward
    new_coordinates = @navigation.move_rover_forward(facing: @direction, coordinates: @coordinates)
    @coordinates = { x: new_coordinates[:x], y: new_coordinates[:y], lost: new_coordinates[:lost] }
  end

  def lost?
    @coordinates[:lost] == true
  end

  def status
    lost? ? "#{template}" + " LOST" :  "#{template}"
  end

  private

  def template
    "(#{@coordinates[:x]}, #{@coordinates[:y]}, #{@direction})"
  end
end
