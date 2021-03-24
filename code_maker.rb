# Contains methods for generating and checking a randomized code
require_relative 'code'

class CodeMaker

  # TODO: Generate an initial code
  def initialize(code)

    @secret_code = code
  end

  # HACK?: Check a code against the private one. Return number of exact correct
  # Guesses and number of correct answers in wrong position
  # This feels like I have an extra object
  def check_code(code)
    @secret_code.check_code(code)
  end
end