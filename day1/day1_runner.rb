require_relative 'day1'

def part1(input_file = 'day1_data.txt')
  day1 = Day1.new(input_file)
  day1.part1
end

def part2(input_file = 'day1_data.txt')
  day1 = Day1.new(input_file)
  day1.part2
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
elsif ARGV[0] == 'part2'
  if ARGV[1]
    puts "Part 2 using input file #{ARGV[1]} answer:"
    puts part2(ARGV[1])
  else
    puts "Part 2 answer:"
    puts part2
  end
else
  puts "Usage: ruby day1_runner.rb part1|part2 [input_file]"
end
