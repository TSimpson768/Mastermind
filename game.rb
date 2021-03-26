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
    won = false
    12.times do
      won = @breaker.make_guess(@maker)
      break if won
    end
  end
  game_over(won)

  private

  # A main menu
  def menu
    puts "Welcome to Mastermind!\n Enter help to read the instructions\n Press any key to start!"
    input = gets
    print_instructions if input == "help\n"
  end
end
