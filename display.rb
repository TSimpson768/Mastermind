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
    p code
  end

  # int, int -> null
  # TODO: Method for rendering key pegs
  def render_pegs(black_pegs, white_pegs)
    p "Black #{black_pegs}, white #{white_pegs}"
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
    puts 'Placeholeder. Press the any key to continiue...'
    gets
  end
  
end