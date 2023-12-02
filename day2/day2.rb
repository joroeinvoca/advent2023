class Day2
  def initialize(input_file)
    @input = File.readlines(input_file)

    @CUBE_GUESS = {
      'red' => 12,
      'green' => 13,
      'blue' => 14
    }
  end

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

  def max_cubes_in_all_games
    game_results = {}


    @input.each do |line|
      game_results[line.scan(/\d+(?=:)/).first.to_i] = max_per_color_per_game(line)
    end
    game_results
  end

  def max_per_color_per_game(line)
    single_game_result = {
      'red' => 0,
      'green' => 0,
      'blue' => 0
    }

    grabs = line.sub(/.*?:/, '').split(';')
    grabs.each do |grab|
      grab.split(',').each do |color_quantity|
        if color_quantity.include?('red')
          if color_quantity[/\d+/].to_i > single_game_result['red']
            single_game_result['red'] = color_quantity[/\d+/].to_i
          end
        elsif color_quantity.include?('green')
          if color_quantity[/\d+/].to_i > single_game_result['green']
            single_game_result['green'] = color_quantity[/\d+/].to_i
          end
        elsif color_quantity.include?('blue')
          if color_quantity[/\d+/].to_i > single_game_result['blue']
            single_game_result['blue'] = color_quantity[/\d+/].to_i
          end
        end
      end
    end
    single_game_result
  end

  def part2

  end
end