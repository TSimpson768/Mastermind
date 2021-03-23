# Contains methods for interacting with a human code breaker
require_relative 'display'

class CodeBreaker

  include Display
  
  # TODO: Initialize any required class variables
  def initialize
    @previous_guesses = []
  end

  # TODO: Return a valid guess from user input
  def make_guess
    input_guess
  end
end