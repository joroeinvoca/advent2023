require 'aoc/grid'

class Day3
  # Initializes a new instance of the Day3 class.
  #
  # Parameters:
  # - file_name: A string representing the path to the input file.
  def initialize(file_name)
    @grid = Aoc::Grid.from_file(file_name)
  end

  # Calculates the solution for part 1 of the puzzle.
  #
  # Returns:
  # The sum of relevant numbers that touch symbols (not '.').
  def part1
    part_numbers = find_relevant_numbers(/[^.]/).map(&:to_s).map(&:to_i)
    part_numbers.sum
  end

  # Finds relevant numbers based on a given condition.
  #
  # Parameters:
  # - condition: A regular expression pattern to match against the neighbors of each region.
  #
  # Returns:
  # An array of region objects that match the given condition.
  def find_relevant_numbers(condition)
    regions = @grid.find_horizontal_regions(/\d+/)
    part_numbers = []
    regions.each do |region|
      region.neighbors.each do |neighbor|
        if neighbor.to_s =~ condition
          part_numbers << region
          break
        end
      end
    end
    part_numbers
  end

  # Calculates the solution for part 2 of the puzzle.
  #
  # Returns:
  # The sum of products of numbers where a gear touches both of the numbers.
  def part2
    part_number_products = []
    part_numbers = find_relevant_numbers(/\*/)
    find_adjoining_gears(part_numbers).each do |gear, numbers|
      if numbers.count > 1
        part_number_products << numbers.inject(:*)
      end
    end
    part_number_products.sum
  end

  # Finds the adjoining gears for each part number.
  #
  # Parameters:
  # - part_numbers: An array of region objects representing the relevant part numbers.
  #
  # Returns:
  # A hash where the keys are the adjoining gears and the values are arrays of part numbers.
  def find_adjoining_gears(part_numbers)
    gears_and_their_numbers = {}
    part_numbers.each do |part_number|
      part_number.neighbors.each do |neighbor|
        if neighbor.to_s =~ /\*/
          if gears_and_their_numbers[neighbor] && !gears_and_their_numbers[neighbor].include?(part_number.to_s.to_i)
            gears_and_their_numbers[neighbor] << part_number.to_s.to_i
          else
            gears_and_their_numbers[neighbor] = [part_number.to_s.to_i]
          end
        end
      end
    end
    gears_and_their_numbers
  end
end
