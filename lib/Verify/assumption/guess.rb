class Verify::Assumption::Guess

  class WrongAssumptions < StandardError
  end

  class WrongAssumptionsAbout < StandardError
    attr_accessor :message

    def initialize message
      self.message = message
    end
  end

  def initialize
    @results = ""
  end

  def assert result
    unless result
      raise WrongAssumptions
    end
  end

  def assert_equal state, expectation
    result = state == expectation

    assert result

  rescue WrongAssumptions => e
    raise WrongAssumptionsAbout.new "Expected #{expectation.inspect}, but was #{state.inspect}"
  end

  attr_reader :results

end
