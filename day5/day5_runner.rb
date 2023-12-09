require_relative 'day5'

part = ARGV[0]
file_name = ARGV[1] || 'day5_data.txt'

day5 = Day5.new(file_name)

if part == 'part1'
  puts day5.part1
elsif part == 'part2'
  puts day5.part2
else
  puts "Invalid argument. Please specify 'part1' or 'part2'."
end