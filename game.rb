# Game contains methods for managing the flow of the game

class Game
  include 'Display'

  # TODO: Create initial gamestate, of breaker player, maker player
  def initialize
    @maker = CodeMaker.new
    @breaker = CodeBreaker.new
  end

  # TODO: Loop 12 times of getting a guess from breaker, checking against the secret
  # code and printing result.
  def play
    12.times do
      guess = input_guess
      black_pegs, white_pegs = CodeMaker.check_code(guess)
      render_code(guess)
      render_pegs(black_pegs, white_pegs)
      if black_pegs == 4
        puts "YOU'RE WINNER!"
        break
      end
    end
  end
  
end