require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase
  test ".evaluate_string intiger" do
    string = '5*3+1+6/2+9*100'

    assert_equal 919, Calculator.evaluate_string(string)
  end

  test ".evaluate_string float" do
    string = '5*3+1+6/85+9*100'

    assert_equal 916.07, Calculator.evaluate_string(string)
  end
end
