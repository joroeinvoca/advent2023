require_relative 'day4'

part = ARGV[0]
file_name = ARGV[1] || 'day4_data.txt'

day4 = Day4.new(file_name)

if part == 'part1'
  puts day4.part1
elsif part == 'part2'
  puts day4.part2
else
  puts "Invalid argument. Please specify 'part1' or 'part2'."
end