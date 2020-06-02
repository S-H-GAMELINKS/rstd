require "test_helper"
require "rstd"

class RstdArrayTest < Minitest::Test
  def setup
    using Rstd::Array
    ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def test_rstd_array_first_last
    # Get ary first and last value
    result = ary.first_last
    assert_equal [1, 10]

    # Get ary first and last value's for get value count
    result = ary.first_last(3)
    assert_equal [1, 2, 3], result.first
    assert_equal [8, 9, 10], result.last
    assert_kind_of Array, result

    # Get ary first and last value reversed
    result = ary.first_last(reversed: true)
    assert_equal [10, 1], result
    assert_kind_of Array, result

    # Get ary first and last value's for get value count & rversed
    result = ary.first_last(3, reversed: true)
    assert_equal [3, 2, 1], result.first
    assert_equal [10, 9, 8], result.last
    assert_kind_of Array, result
  end
end
