require "test_helper"
require "rstd"

using Rstd::RefineInteger

class RstdIntegerTest < Minitest::Test
  def setup
    @num = 42
  end

  def test_rstd_inc
    # Increment num
    result = @num.inc
    assert_equal 43, result
    assert_kind_of Integer, result

    result = @num.inc.inc
    assert_equal 44, result
    assert_kind_of Integer, result
  end
end
