require './assumptions/preassumptions'

class ValidAssumption < Verify::Assumption

  maybe "asserts true" do
    assert true
  end

  maybe "asserts multiple trues" do
    assert true
    assert true
    assert true
  end

  maybe "asserts equality" do
    assert_equal 1, 1
  end

  teardown do

  end
end
