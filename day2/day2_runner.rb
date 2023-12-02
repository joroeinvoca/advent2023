require_relative 'day2'  # Assuming day2.rb is in the same directory

if ARGV.empty?
  puts "Please provide a part number (1 or 2) as a command-line argument."
else
  part = ARGV[0].to_i
  day2 = Day2.new(ARGV[1] || 'day2_data.txt')  # This will be nil if no second argument is provided

  case part
  when 1
    puts "Day 2 Part 1 answer: #{day2.part1}"
  when 2
    puts "Day 2 Part 2 answer: #{day2.part2}"
  else
    puts "Invalid part number. Please provide 1 or 2."
  end
end