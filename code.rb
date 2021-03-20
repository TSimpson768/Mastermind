
# Contains an individual code
class Code

  def initialize(peg1, peg2, peg3, peg4)
    @pegs = []
    @pegs[0] = peg1
    @pegs[1] = peg2
    @pegs[2] = peg3
    @pegs[3] = peg4
  end
  attr_reader :pegs

  # Code -> [int, int]
  # TODO: Takes a code to compare against, and returns number of black (correct color + pos)
  # and white (correct color only) pegs to award.
  def check_code(code)
    
  end

  private
  # Code -> int
  # TODO; Returns number of exact matches between this code and given code
  def black_pegs(code)
    
  end

  # Code -> int
  # TODO; Return number of matched colored pegs between this code and given code
  def white_pegs(code)
    
  end
end