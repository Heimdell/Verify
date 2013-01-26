class Verify::Assumption::Guess
  attr_reader :results

  class WrongAssumptions < StandardError; end

  class WrongAssumptionsAbout < StandardError
    attr_accessor :message

    def initialize message
      self.message = message
    end
  end

  def initialize
    @results = ""
  end

  def assert proposition
    raise WrongAssumptions unless proposition
    proposition
  end

  def assert_equal state, expectation
    proposition = state === expectation
    assert proposition

  rescue WrongAssumptions => e
    raise WrongAssumptionsAbout.new "Expected #{expectation.inspect}, but was #{state.inspect}"

  end
end
