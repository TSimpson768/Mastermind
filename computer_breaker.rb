# frozen_string_literal: true

# Class for a computer code breaker. Solves the game by picking a random possible code
# and deterimines what code matches the awarded pegs

class ComputerBreaker < CodeBreaker
  VALID_RANGE = (1..6).freeze
  def initialize
    super
    create_valid_guesses
    @num_guesses = 0
  end

  def make_guess(maker)
    guess = choose_guess
    @num_guesses += 1
    check_guess(maker, guess)

    remove_invalid_codes(guess)
    broken?
  end

  private

  # Initializes the class variable @valid_guesses, containing every valid code.
  def create_valid_guesses
    @valid_codes = []
    VALID_RANGE.each do |i|
      VALID_RANGE.each do |j|
        VALID_RANGE.each do |k|
          VALID_RANGE.each do |l|
            @valid_codes.push(Code.new([i, j, k, l]))
          end
        end
      end
    end
  end

  # Returns a random possible code, or 1122 for the first turn
  def choose_guess
    if @num_guesses.zero?
      Code.new([1, 1, 2, 2])
    else
      @valid_codes.sample
    end
  end

  # Removes all codes that could not be the secret code, depending on guess
  # and it's associated values of black and white pegs
  def remove_invalid_codes(guess)
    @valid_codes.filter! { |code| code.check_code(guess) == [@black_pegs, @white_pegs] }
    puts "#{@valid_codes.count} possible codes left"
  end
end
