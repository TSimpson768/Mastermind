
require_relative 'display'
# Defines methods required for a human setting the secret code
class HumanMaker < CodeMaker
  include Display
  
  
  def initialize
    super(input_guess)
  end

  # Code -> int, int
  # Takes a code to check against secret code, and returns number of black + white pegs
  def check_code(code)
    black_pegs, white_pegs = super(code)
    print 'Your Code:  '
    render_code(@secret_code)
    print "\nSecret Code:"
    render_code(code)
    input_pegs(black_pegs, white_pegs)
    [black_pegs, white_pegs]
  end

  private

  # int, int -> nil
  # Takes input of number of pegs to award guess, and ensures correct
  # number is given. Gives some interactivity when computer is solving
  def input_pegs(black_pegs, white_pegs)
    puts "\nHow many pegs should be awarded?"
    input_black, input_white = parse_pegs()
    if input_black != black_pegs && input_white != white_pegs
      puts 'CHEATER!'
      puts "black #{input_black} 1= #{black_pegs}, white #{input_white} != #{white_pegs}"
      input_pegs(black_pegs, white_pegs)
    end
  end

  def parse_pegs
    pegs = gets
    if /^[0-4]{2}$/.match?(pegs)
      pegs.split(//)[(0..1)].map!(&:to_i)
    else
      puts 'Invalid input.'
      parse_pegs
    end
  end
end