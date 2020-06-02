require "test_helper"
require "rstd"

using Rstd

class RstdArrayTest < Minitest::Test
  def setup
    @ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def test_rstd_array_first_last
    # Get ary first and last value
    result = @ary.first_last
    assert_equal [[1], [10]], result

    # Get ary first and last value's for get value count
    result = @ary.first_last(3)
    assert_equal [1, 2, 3], result.first
    assert_equal [8, 9, 10], result.last
    assert_kind_of Array, result

    # Get ary first and last value reversed
    result = @ary.first_last(reversed: true)
    assert_equal [[1], [10]], result
    assert_kind_of Array, result

    # Get ary first and last value's for get value count & rversed
    result = @ary.first_last(3, reversed: true)
    assert_equal [3, 2, 1], result.first
    assert_equal [10, 9, 8], result.last
    assert_kind_of Array, result
  end

  def test_rstd_array_rsum
    # Sum of value in Array(but it's rightside value's sum)
    result = @ary.rsum
    assert_equal 55, result

    result = @ary.rsum(3)
    assert_equal 27, result

    result = @ary.rsum(100)
    assert_equal 55, result
  end

  def test_rstd_array_lsum
    # Sum of value in Array(but it's leftside value's sum)
    result = @ary.lsum
    assert_equal 55, result

    result = @ary.lsum(3)
    assert_equal 6, result

    result = @ary.lsum(100)
    assert_equal 55, result
  end

  def test_rstd_array_rsort
    # Sort value in Array, and reverse it
    result = @ary.rsort
    assert_equal @ary.reverse, result
  end

  def test_rstd_array_to_range
    # Convert to Range
    range = @ary.to_range
    assert_equal (0..9), range
    assert_kind_of Range, range
  end
end
