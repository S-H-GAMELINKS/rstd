require "test_helper"
require "rstd"

using Rstd::RefineInteger

class RstdIntegerTest < Minitest::Test
  def setup
    @num = 42
  end

  def test_rstd_integr_inc
    # Increment num
    result = @num.inc
    assert_equal 43, result
    assert_kind_of Integer, result

    result = @num.inc.inc
    assert_equal 44, result
    assert_kind_of Integer, result
  end

  def test_rstd_integer_dec
    # Decrement num
    result = @num.dec
    assert_equal 41, result
    assert_kind_of Integer, result

    result = @num.dec.dec
    assert_equal 40, result
    assert_kind_of Integer, result
  end

  def test_rstd_integer_mod
    # Get num mod
    result = @num.mod(40)
    assert_equal 2, result
    assert_kind_of Integer, result

    result = @num.mod(2)
    assert_equal 0, result
    assert_kind_of Integer, result
  end

  def test_rstd_integer_pow
    # Powers num
    result = @num.pow
    assert_equal 42**2, result
    assert_kind_of Integer, result

    result = @num.pow(2)
    assert_equal 42**2, result
    assert_kind_of Integer, result

    result = @num.pow(5)
    assert_equal 42**5, result
    assert_kind_of Integer, result
  end

  using Integer.refine_method(:sum){|*args|
    return self if args.empty?
    result = self
    args.each{|arg| result += arg }
    return result
  }

  def test_rstd_integer_refine_method
    # Dynamic refinements
    result = @num.sum

    assert_equal 42, result
    assert_kind_of Integer, result

    result = @num.sum(1, 2, 3, 4, 5)

    assert_equal 57, result
    assert_kind_of Integer, result
  end
end
