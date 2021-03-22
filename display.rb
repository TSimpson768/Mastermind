# contains methods for outputing to the console

module Display

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
    
  end

  # [int, int] -> null
  # TODO: Method for rendering key pegs
  def reder_pegs(pegs)
    
  end

  private

  # TODO: Take a string and returns a code object.
  # Regex should only match if 4 digits between 1-6 were input by user
  def parse(input)
    if /^[1-6]{4}$/.match(input)
      code = input.split(//)
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
  
end