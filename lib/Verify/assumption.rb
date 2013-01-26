class Verify::Assumption
  autoload :Guess, 'Verify/assumption/guess'

  def self.setup &block
    @@preparation = block
  end

  def self.teardown &block
    @@cleaning = block
  end

  setup do
    puts "We came unprepared."
  end

  teardown do
    puts "We're leaving the kitchen dirty."
  end

  def self.maybe(message, &block)
    puts "Running: #{message}"

    guess = Guess.new

    guess.instance_eval &@@preparation
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

  ensure
    guess.instance_eval &@@cleaning

  end
end
