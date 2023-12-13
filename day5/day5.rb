require 'pry-nav'
require 'set'

# This class represents the solution for Day 5 of the Advent of Code 2023 challenge.
# It contains the necessary methods and logic to solve the problem.
class Day5
  # Initializes a new instance of the class.
  # 
  # Parameters:
  # - file_name: A string representing the path to the file.
  # 
  # Returns:
  # - None
  def initialize(file_name)
    chunks = File.read(file_name).split("\n\n")
    @seeds = chunks[0].split(":")[1].split(" ").map(&:to_i)
    @maps = Array.new(chunks.size - 1) { Hash.new }
    chunks.drop(1).each_with_index do |raw_map, index|
      puts "init: #{index}"
      temp_hash = {}
      raw_map.split("\n").drop(1).each do |row_string|
        result_item, start_item, range = row_string.split(" ").map(&:to_i)
        temp_hash[Set.new(start_item..(start_item + range - 1))] = (result_item - start_item)
      end
      @maps[index] = temp_hash
    end
  end

  def seeds_to_sets
    @seeds.each_slice(2).map do |start, length|
      'Setting a Seed'
      Set.new(start..(start + length - 1))
    end
  end

  # Converts a seed value using the defined maps.
  #
  # Parameters:
  # - seed: The seed value to be converted.
  #
  # Returns:
  # The converted value.
  def convert_seed(seed, index = 0)
    mapped_value = seed
    @maps.drop(index).each do |map|
      map.keys.each do |range|
        if range.include?(mapped_value)
          mapped_value = mapped_value + map[range]
          break
        end
      end
    end
    mapped_value
  end

  def convert_some_seeds(seed_set)

    # find the map sets that intersect with the seeds
    map_sets_containing_seeds = @maps[0].keys.select do |map_set|
      map_set.intersect?(seed_set)
    end

    # for each intersecting map set, find the lowest intersecting seed value
    possible_min = {}
    map_sets_containing_seeds.each do |map_set|
      possible_min[(map_set & seed_set).min] = map_set
    end

    minimum_matching_value = possible_min.keys.min
    minimum_matching_set = @maps[0].keys.find { |map_set| map_set.include?(minimum_matching_value) }
    converted_seed = minimum_matching_value + @maps[0][minimum_matching_set]

    convert_seed(converted_seed, 1)
  end

  # Calculates the minimum value obtained by converting each seed in @seeds.
  #
  # @return [Integer] The minimum converted value.
  def part1
    @seeds.map { |seed| convert_seed(seed) }.min
  end

  # Calculates the minimum converted seed value for each seed range and returns the overall minimum value.
  #
  # @return [Integer] The minimum converted seed value.
  def part2
    @seed_sets = seeds_to_sets
    min_value = nil
    @seed_sets.each do |seed_set|
      puts "seed_set: #{seed_set}"
      seed_set.each do |seed|
        converted_seed = convert_seed(seed)
        if min_value.nil? || converted_seed < min_value
          min_value = converted_seed
        end
      end
    end
    min_value
  end
end