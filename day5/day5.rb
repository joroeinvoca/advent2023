require 'set'

class Day5
  def initialize(file_name)
    chunks = File.read(file_name).split("\n\n")
    @seeds = chunks[0].split(":")[1].split(" ").map(&:to_i)
    @maps = Hash.new { |h, k| h[k] = []}
    chunks.drop(1).each_with_index do |raw_map, index|
      raw_map.split("\n").drop(1).each do |row_string|
        result_item, start_item, range = row_string.split(" ").map(&:to_i)
        @maps[index] << { start_item..(start_item + range - 1) => result_item..(result_item + range - 1)}
      end
    end
  end

  def part1

  end

  def part2

  end
end