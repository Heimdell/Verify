class Verify::Assumption
  autoload :Guess, 'Verify/assumption/guess'
  autoload :Theory, 'Verify/theory'

  def self.setup &block
    define_method :assumption_setup do
      @@preparation = block
    end
  end

  def self.teardown &block
    define_method :assumption_teardown do
      @@cleaning = block
    end
  end

  setup do
  end

  teardown do
  end

  def self.maybe(message, &block)
    define_method "#{message}_assumption" do
      result = nil

      begin
        guess = Guess.new

        assumption_setup

        guess.instance_eval &@@preparation
        guess.instance_eval &block

        result = :proved

      rescue Guess::WrongAssumptions => e
        result = :falture

      rescue Guess::WrongAssumptionsAbout => e
        result = :falture

      rescue
        result = :error

      ensure
        assumption_teardown

        guess.instance_eval &@@cleaning
      end

      return result
    end
  end

  def self.prove
    instance = self.new

    cases = instance.methods.grep(/_assumption/)

    concrete_results = cases.map do |assumption|
      { assumption => instance.send(assumption) }
    end
  end

  def self.inherited(subclass)
    Theory.assume self => [subclass]
  end

end
