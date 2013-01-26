require './assumptions/preassumptions'

class VerifyVerify < Verify::Assumption
  setup do
    @value = 1
  end

  maybe 'assert knows the truth' do
    assert_equal @value, 1
  end

  maybe 'assert shows failed assumptions' do
    assert_equal @value, 2
  end
end
