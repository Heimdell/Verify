
class Theory
  def self.theories
    @theories ||= {}
  end

  def self.for root
    self.theories[root]
  end

  def self.assume hash
    self.theories.merge! hash do |_key, old_val, new_val|
      old_val ||= []
      old_val + new_val
    end
  end
end