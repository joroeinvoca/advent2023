require_relative 'day1'

def part1(input_file = 'day1_data.txt')
  day1 = Day1.new(input_file)
  day1.part1
end

# to run from command line, specify args for part and optionally file name
if ARGV[0] == 'part1'
  if ARGV[1]
    puts "Part 1 using input file #{ARGV[1]} answer:"
    puts part1(ARGV[1])
  else
    puts "Part 1 answer:"
    puts part1
  end
end
