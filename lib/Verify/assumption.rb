class Verify::Assumption
  autoload :Guess, 'Verify/assumption/guess'

  def self.maybe(message, &block)
    puts "Running: #{message}"

    guess = Guess.new

    guess.instance_eval &block

    puts '.'

  rescue Guess::WrongAssumptions => e
    puts "  Assertion failed."
    puts '!'

  rescue Guess::WrongAssumptionsAbout => e
    puts "  Assertion failed: #{e.message}."
    puts '!'

  rescue
    puts '?'

  end
end
