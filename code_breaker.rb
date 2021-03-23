# frozen_string_literal: true

# Contains methods for interacting with a human code breaker
require_relative 'display'

# CodeBreaker represents a human code breaker player, and all info about their game so far
class CodeBreaker
  include Display
  # TODO: Initialize any required class variables
  def initialize
    @previous_guesses = []
  end

  # Return a valid guess from user input. Exists to be over-rided by computer breaker
  def make_guess
    guess = input_guess
    @previous_guesses.push(guess)
    guess
  end
end
