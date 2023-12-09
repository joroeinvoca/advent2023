require 'pry-nav'

class Day5
  def initialize(file_name)
    chunks = File.read(file_name).split("\n\n")
    @seeds = chunks[0].split(":")[1].split(" ").map(&:to_i)
    @maps = Array.new(chunks.size - 1, Hash.new)
    chunks.drop(1).each_with_index do |raw_map, index|
      temp_hash = {}
      raw_map.split("\n").drop(1).each do |row_string|
        result_item, start_item, range = row_string.split(" ").map(&:to_i)
        temp_hash[start_item..(start_item + range - 1)] = (result_item - start_item)
      end
      @maps[index] = temp_hash
    end
  end

  def convert_seed(seed)
    mapped_value = seed
    @maps.each do |map|
      map.keys.each do |range|
        if range.include?(mapped_value)
          mapped_value = mapped_value + map[range]
          break
        end
      end
    end
    mapped_value
  end

  def part1

  end

  def part2

  end
end