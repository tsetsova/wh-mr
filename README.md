# Instructions

The app uses ruby version '2.5.1', you can install it with rvm or rbenv.

Or you can use your own ruby version and it should work, but make sure you remove the requirement for a specific ruby version from the Gemfile before running the app.

Install the dependencies

```
bundle install
```

If you don't have bundler, install it with

```
gem install bundler
```

To run the tests

```
rspec
```

To run the app, make sure you're at the root of the project and run

```
ruby lib/cli.rb
```

Example usage

```
Type in the map width and height
For example: 4 8
num num

Please put in valid numbers for width and height
5 6

Type in the x and y coordinates and orientation and commands for your rover
For example: 2 3 N FFRFFL

1 4 E RRFFL
(0, 4, W) LOST
```

The app will keep prompting you for valid map height and width input.

Similarly the app will validate against some invalid orientation and commands.

# Improvements

- if I had more time I would improve the cli and the user input validation
