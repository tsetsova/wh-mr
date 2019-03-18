require_relative "rover"
require_relative "navigation"

class App
  def initialize(rover_class: Rover, navigation_class: Navigation,  map_size: )
    @rover_class = rover_class
    @navigation_class = navigation_class
    @map_size = map_size
  end

  def place_rover(coordinates:, direction:)
    @rover = @rover_class.new(coordinates: coordinates, direction:direction, navigation:@navigation_class.new(map_size: @map_size))
  end

  def run(commands)
    commands.each{ |command| perform(command) }
    @rover.status
  end

  def perform(command)
    return if @rover.lost?

    if command == :F
      @rover.move_forward
    elsif command == :L
      @rover.turn_left
    elsif command == :R
      @rover.turn_right
    else
      raise ArgumentError.new("Invalid Command")
    end
  end
end
