class Day4
  def initialize(file_name)
    @input = File.readlines(file_name)
  end

  # Calculates the total score of all cards in the input.
  #
  # Returns the grand total score.
  def part1
    grand_total = 0
    cards = []
    @input.each do |line|
      card = Card.new(line)
      cards << card
    end

    cards.each do |card|
      grand_total += card.card_score
    end
    grand_total
  end

  # Calculates the number of cards in the deck after applying a specific algorithm.
  # The algorithm involves duplicating cards based on certain conditions.
  # Returns the count of cards in the deck.
  def part2
    deck = []
    @input.each do |line|
      deck << Card.new(line)
    end
    
    deck.each do |card|
      if card.game_number % 10 == 0
        puts "Card number: #{card.game_number}"
      end
      win_quantity = card.my_winning_numbers.length
      # fun fact, this magical i starts at 0
      win_quantity.times do |i|
        deck << deck.find { |c| c.game_number == card.game_number + i + 1 }.dup
      end
    end

    deck.count
  end

  class Card
    attr_reader :game_number, :winning_numbers, :my_numbers

    # Initializes a new Card object.
    #
    # @param input_line [String] the input line containing the card number and values
    def initialize(input_line)
      card_num_and_values = input_line.split(':')
      @game_number = card_num_and_values[0].match(/\d+/)[0].to_i
      winning_and_my_numbers = card_num_and_values[1].split('|')
      @winning_numbers = winning_and_my_numbers[0].split(' ').map(&:to_i)
      @my_numbers = winning_and_my_numbers[1].split(' ').map(&:to_i)
    end

    # Returns the numbers that match both the winning numbers and the player's numbers.
    #
    # @return [Array<Integer>] the matching numbers
    def my_winning_numbers
      @winning_numbers & @my_numbers
    end

    # Calculates the score of the card based on the number of matching numbers.
    #
    # @return [Integer] the score of the card
    def card_score
      score = 0
      winners = my_winning_numbers.length
      if winners > 0
        score += 1
        (winners - 1).times do |i|
          score = score * 2
        end
      end
      score
    end
  end
end