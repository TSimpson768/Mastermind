# Contains methods for generating and checking a randomized code
require_relative 'code'

class CodeMaker

  # TODO: Generate an initial code
  def initialize
    prng = Random.new
    secret = []
    4.times do
      secret.push(prng.rand(1..6))
    end
    @secret_code = Code.new(secret)
  end

  # HACK?: Check a code against the private one. Return number of exact correct
  # Guesses and number of correct answers in wrong position
  # This feels like I have an extra object
  def check_code(code)
    @secret_code.check_code(code)
  end
end