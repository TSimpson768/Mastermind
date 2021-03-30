# frozen_string_literal: true

# Game contains methods for managing the flow of the game
require_relative 'display'
require_relative 'code_breaker'
require_relative 'code'
require_relative 'computer_breaker'

# Game is the class that starts the game and creates the object containing the gamestate
class Game
  include Display
  # TODO: Loop 12 times of getting a guess from breaker, checking against the secret
  # code and printing result.
  def play
    menu
    create_players
    won = false
    12.times do
      won = @breaker.make_guess
      break if won
    end
    game_over(won)
  end

  private

  # A main menu
  def menu
    puts "👋👋Welcome to Mastermind!\n Enter help to read the instructions\n Press any key to start!"
    input = gets
    print_instructions if input == "help\n"
  end

  # Creates Objects for each player
  def create_players
    @breaker = if human_breaker?
                 CodeBreaker.new
               else
                 ComputerBreaker.new
               end
  end
end
