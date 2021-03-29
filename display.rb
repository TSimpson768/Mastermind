# contains methods for outputing to the console

require_relative 'code'

module Display

  # TODO: Retruns true if player is breaking the code, false if generating
  def human_breaker?
    puts "Do you want to\n1. play as the code breaker, or\n2. do you want to make a code for the computer to break?"
    input = gets.to_i
    case input
    when 1 then true
    when 2 then false
    else
      puts 'Try again'
      human_breaker?
    end
  end
  # TODO: Asks player for and returns a guess
  def input_guess
    puts 'Guess the code!'
  begin
    input = gets
    parse(input)
  rescue NoMethodError
    input_error
  end
  end

  # Code -> null
  # TODO: Method for outputting a secret code
  def render_code(code)
    code.pegs.each { |peg| render_peg(peg) }
  end

  # int, int -> null
  # TODO: Method for rendering key pegs
  def render_pegs(black_pegs, white_pegs)
    black_pegs.times do
      print '⚫'
    end
    white_pegs.times do
      print '⚪'
    end
    puts
  end

  private

  # TODO: Take a string and returns a code object.
  # Regex should only match if 4 digits between 1-6 were input by user
  def parse(input)
    if /^[1-6]{4}$/.match(input)
      code = input.split(//)[(0..3)]
      code.map!(&:to_i)
      Code.new(code)
    else
      input_error
    end
  end

  def input_error
    puts 'Invalid input. Please enter a 4 number code, with each digit between 1-6.'
    input_guess
  end

  def print_instructions
    puts 'This is mastermind! In this game, one player makes a 4 digit code, where'
    puts 'each digit has 6 possible values'
    (1..6).each { |peg| render_peg(peg) }
    puts
    puts 'The other player has to guess the code within 12 attempts. After each attempt'
    puts 'the code setter awards it a number of pegs. A black peg ⚫ indicates one digit'
    puts 'has a correct value and is in the correct position, and a white peg ⚪ indicates'
    puts 'a peg has the correct value, but is in the wrong place.'
    puts
    puts 'For example, if the secret code was'
    render_code(Code.new([5, 6, 6, 2]))
    puts
    puts 'and the guess'
    render_code(Code.new([5, 6, 5, 6]))
    puts
    puts 'Was made, the guess would recieve ⚫⚫⚪. This is as the values in position 1 and 2 '
    puts 'match exactly, and the value in position 3 of the secret code matches that in position'
    puts '4 of the guess. Note that position 3 of the guess matches position 1 of the secret, but'
    puts 'no peg is awarded, as this value has already been matched.'

    puts 'Ready to play? Press the any key to continue...'
    gets
  end

  # Prints the result of the game
  def game_over(won)
    if won
      puts 'The code has been broken! Game over'
    else
      puts 'The code could not be broken! Game over'
    end
  end

  # Int -> nil
  # Puts a string representation of a single peg to the console
  def render_peg(peg)
    if peg == 6
      print "\e[47m\e[30m  #{peg}  \e[0m"
    else
      print "\e[4#{peg}m  #{peg}  \e[0m"
    end
  end
end