require "test_helper"
require "rstd"

using Rstd::RefineFalse

class RstdFalseTest < Minitest::Test
  def setup
    @false = false
  end

  def test_rstd_true_present?
    # Check FalseClass is present
    result = @false.present?
    assert !result
    assert_kind_of FalseClass, result

    result = !@false.present?
    assert result
    assert_kind_of TrueClass, result
  end
end
