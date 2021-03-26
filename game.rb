# Game contains methods for managing the flow of the game
require_relative 'display'
require_relative 'code_breaker'
require_relative 'code_maker'
require_relative 'code'
class Game
  include Display
  # TODO: Loop 12 times of getting a guess from breaker, checking against the secret
  # code and printing result.
  def play
    menu

    if human_breaker?
      @maker = CodeMaker.new(Code.generate_code)
      @breaker = CodeBreaker.new
    else
      @maker = HumanMaker(code)
      @breaker = ComputerBreaker
    end
    12.times do
      guess = @breaker.make_guess(@maker)
      
      if guess
        puts "YOU'RE WINNER!"
        break
      end
    end
  end

  private

  # A main menu
  def menu
    puts "Welcome to Mastermind!\n Enter help to read the instructions\n Press any key to start!"
    input = gets
    print_instructions if input == "help\n"
  end
end
