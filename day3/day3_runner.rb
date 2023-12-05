require_relative 'day3'

part = ARGV[0]
file_name = ARGV[1] || 'day3_data.txt' # replace 'default.txt' with your default file name

day3 = Day3.new(file_name)

if part == 'part1'
  puts day3.part1
elsif part == 'part2'
  puts day3.part2
else
  puts "Invalid argument. Please specify 'part1' or 'part2'."
end