require_relative 'game'
require_relative 'display'
class MainMenu
  include Display
  def initialize
  end

  # A main menu
  def menu
    puts "Welcome to Mastermind!\n Enter help to read the instructions\n Press any key to start!"
    input = gets
    print_instructions if input == "help\n"
    game = Game.new
    game.play
  end

  private

  def print_instructions
    puts 'Placeholeder. Press the any key to continiue...'
    gets
  end
end