class Verify::Assumption
  autoload :Guess, 'Verify/assumption/guess'

  @@preparation = proc do
    puts "We came unprepared."
  end

  @@cleaning = proc do
    puts "We're leaving the kitchen dirty."
  end

  def self.setup &block
    @@preparation = block
  end

  def self.teardown &block
    @@cleaning = block
  end

  def self.maybe(message, &block)
    puts "Running: #{message}"

    guess = Guess.new

    guess.instance_eval &@@preparation
    guess.instance_eval &block
    guess.instance_eval &@@cleaning

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
