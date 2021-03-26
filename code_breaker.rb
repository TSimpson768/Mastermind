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

  # TODO: Move (ruby) code to check (secret) code in here, and save the black pegs and white pegs
  # to instance variables. This is so they are in the object without having to expose any of the
  # AI's brain
  def make_guess(maker)
    guess = input_guess
    @black_pegs, @white_pegs = maker.check_code(guess)
    render_code(guess)
    render_pegs(@black_pegs, @white_pegs)
    broken?
  end

  private

  def broken?
    @black_pegs == 4
  end
end
