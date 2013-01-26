require './assumptions/preassumptions'

class InvalidAssumptions < Verify::Assumption

  maybe "asserts true" do
    assert false
    assert true
    assert false
  end

  maybe "asserts true" do
    assert true
    assert true
    assert false
  end

  maybe "asserts equality" do
    assert_equal 1, 2
  end

end