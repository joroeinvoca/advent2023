require 'aoc/grid'

class Day3
  def initialize(file_name)
    @grid = Aoc::Grid.from_file(file_name)
  end

  def part1
    # find numbers that touch symbols (not .)
    regions = @grid.find_horizontal_regions(/\d+/)
    part_numbers = []
    regions.each do |region|
      region.neighbors.each do |neighbor|
        if neighbor.to_s != '.'
          part_numbers << region.to_s.to_i
          break
        end
      end
    end
    # add 'em
    part_numbers.sum
  end
end
