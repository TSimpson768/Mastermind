# frozen_string_literal: true

# Contains methods for interacting with a human code breaker
require_relative 'display'

# CodeBreaker represents playing with a human code breaker player, and all info about their game so far
class CodeBreaker
  include Display
  # Initialize any required class variables
  def initialize
    @secret = Code.generate_code
  end

  # Logic for taking a guess and returning the result
  def make_guess
    guess = input_guess
    check_guess(guess)
    render_code(guess)
    render_pegs(@black_pegs, @white_pegs)
  end

  private

  # CodeMaker, code -> Boolean
  # Checks the given guess against secret code, and returns true if correct, false if not
  # Exists to avoid repeating code in ComputerBreaker
  def check_guess(guess)
    @black_pegs, @white_pegs = @secret.check_code(guess)
    broken?
  end

  def broken?
    @black_pegs == 4
  end
end
