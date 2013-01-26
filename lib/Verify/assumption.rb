
class Verify::Assumption
  autoload :Guess, 'Verify/assumption/guess'

  def self.maybe(message, &block)
    puts "Running: #{message}"

    guess = Guess.new

    guess.instance_eval &block

  rescue Guess::WrongAssumptions => e
    puts "  Assertion failed."

  rescue Guess::WrongAssumptionsAbout => e
    puts "  Assertion failed: #{e.message}."

  ensure
    puts "  #{guess.results}"
    puts
  end
end