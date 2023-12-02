# The Day2 class represents a solution for the Advent of Code challenge on Day 2.
class Day2
  def initialize(input_file)
    @input = File.readlines(input_file)

    @CUBE_GUESS = {
      'red' => 12,
      'green' => 13,
      'blue' => 14
    }
  end

  # Calculates the sum of games that are possible based on the cube guesses.
  #
  # Returns the sum of possible games
  def part1
    possible_games = []
    max_cubes_in_all_games.each do |game_number, color_quantities|
      possible_games << game_number
      ['red', 'green', 'blue'].each do |color|
        if color_quantities[color] > @CUBE_GUESS[color]
          possible_games.delete(game_number)
        end
      end
    end
    puts "possible games: #{possible_games}"
    possible_games.sum
  end

  # Returns a hash containing the maximum cubes of each color in each game.
  #
  # This method iterates over each line of the input and calculates the maximum number of cubes
  # for each game. The results are stored in a hash where the game number is the key and the
  # maximum number of cubes is the value.
  #
  # Returns a hash containing the maximum number of cubes of each color for each game.
  def max_cubes_in_all_games
    game_results = {}

    @input.each do |line|
      game_results[line.scan(/\d+(?=:)/).first.to_i] = max_per_color_per_game(line)
    end
    game_results
  end

  # Calculates the maximum quantity of each color grabbed in a single game.
  #
  # Parameters:
  # - line: A string representing the input line containing color and quantity information.
  #
  # Returns:
  # A hash representing the maximum quantity of each color grabbed in a single game.
  def max_per_color_per_game(line)
    single_game_result = {
      'red' => 0,
      'green' => 0,
      'blue' => 0
    }

    grabs = line.sub(/.*?:/, '').split(';')
    grabs.each do |grab|
      grab.split(',').each do |color_quantity|
        if color_quantity.include?('red') && color_quantity[/\d+/].to_i > single_game_result['red']
          single_game_result['red'] = color_quantity[/\d+/].to_i
        elsif color_quantity.include?('green') && color_quantity[/\d+/].to_i > single_game_result['green']
          single_game_result['green'] = color_quantity[/\d+/].to_i
        elsif color_quantity.include?('blue') && color_quantity[/\d+/].to_i > single_game_result['blue']
          single_game_result['blue'] = color_quantity[/\d+/].to_i
        end
      end
    end
    single_game_result
  end

  # Calculates the product of the fewest cubes of each color that are in each game.
  #
  # Returns the sum of the calculated values.
  def part2
    # find the fewest cubes of each color that are in each game which is actually the max cubes of each color in each game
    powers = []
    max_cubes_in_all_games.each do |game_number, color_quantities|
      powers << color_quantities.values.inject(:*)
    end
    powers.sum
  end
end