# frozen_string_literal: true

require 'pry'
# Contains an individual code
class Code
  def initialize(pegs)
    @pegs = pegs
  end

  attr_reader :pegs

  # Generate a random code
  def self.generate_code
    prng = Random.new
    secret = []
    4.times do
      secret.push(prng.rand(1..6))
    end
    Code.new(secret)
  end

  # Code -> [int, int]
  # TODO: Takes a code to compare against, and returns number of black (correct color + pos)
  # and white (correct color only) pegs to award.
  def check_code(code)
    guess = code.pegs.clone
    secret = @pegs.clone
    num_black = black_pegs(guess, secret)
    num_white = white_pegs(guess, secret)
    [num_black, num_white]
  end

  private

  # Code -> int
  # TODO; Returns number of exact matches between this code and given code
  def black_pegs(guess, secret)
    num_black = 0
    guess.each_with_index do |peg, index|
      next unless peg == secret[index]

      num_black += 1
      secret[index] = 0
      guess[index] = 0
    end
    num_black
  end

  # Code -> int
  # TODO; Return number of matched colored pegs between this code and given code
  def white_pegs(guess, secret)
    num_white = 0
    guess.each do |peg|
      if peg != 0 && secret.include?(peg)
        num_white += 1
        secret = remove_peg(secret, peg)
      end
    end
    num_white
  end

  # array , int -> array
  # Returns the array with the given value removed
  def remove_peg(pegs, peg)
    index = pegs.find_index(peg)
    pegs.delete_at(index)
    pegs
  end
end
