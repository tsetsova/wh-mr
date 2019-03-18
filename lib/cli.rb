require_relative 'app'

def valid_integer?(num)
  !!(num.match(/^(\d)+$/))
end

puts "Type in the map width and height"
puts "For example: 4 8"

line = gets.chomp

size_x, size_y = line.split(" ")

loop do
  if (size_x && valid_integer?(size_x) && size_y && valid_integer?(size_y))
    @app = App.new(map_size: {width: size_x.to_i, height: size_y.to_i})
    break
  else
    puts "Please put in valid numbers for width and height"

    line = gets.chomp

    size_x, size_y = line.split(" ")
  end
end

loop do
  begin
    puts "Type in the x and y coordinates and orientation and commands for your rover"
    puts "For example: 2 3 N FFRFFL"

    x, y, orientation, commands = gets.chomp.split(" ")
    @app.place_rover(coordinates: {x: x.to_i, y: y.to_i}, direction: orientation.upcase.to_sym)
    puts @app.run(commands.split("").map(&:upcase).map(&:to_sym))
  rescue ArgumentError => e
    puts "Invalid Input"
  end
end
