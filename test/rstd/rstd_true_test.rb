require "test_helper"
require "rstd"

using Rstd::RefineTrue

class RstdTrueTest < Minitest::Test
  def setup
    @true = true
  end

  def test_rstd_true_present?
    # Check TrueClass is present
    result = @true.present?
    assert result
    assert_kind_of TrueClass, result

    result = !@true.present?
    assert !result
    assert_kind_of FalseClass, result
  end
end
