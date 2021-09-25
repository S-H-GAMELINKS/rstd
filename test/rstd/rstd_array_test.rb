require "test_helper"
require "rstd"

using Rstd::RefineArray

class RstdArrayTest < Minitest::Test
  def setup
    @ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @dup_ary = [1, 1, 1, 1, 1]
    @nil_ary = [nil, nil, nil, nil]
    @empty_ary = []
    @true_ary = [1, 2, true]
    @false_ary = [1, 2, false]
    @str_ary = ["1", 2, 3]
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
    assert_kind_of Integer, result

    result = @ary.rsum(3)
    assert_equal 27, result
    assert_kind_of Integer, result

    result = @ary.rsum(100)
    assert_equal 55, result
    assert_kind_of Integer, result
  end

  def test_rstd_array_lsum
    # Sum of value in Array(but it's leftside value's sum)
    result = @ary.lsum
    assert_equal 55, result
    assert_kind_of Integer, result

    result = @ary.lsum(3)
    assert_equal 6, result
    assert_kind_of Integer, result

    result = @ary.lsum(100)
    assert_equal 55, result
    assert_kind_of Integer, result
  end

  def test_rstd_array_rsort
    # Sort value in Array, and reverse it
    result = @ary.rsort
    assert_equal @ary.reverse, result
    assert_kind_of Array, result
  end

  def test_rstd_array_to_range
    # Convert to Range
    result = @ary.to_range
    assert_equal (0..9), result
    assert_kind_of Range, result
  end

  def test_rstd_array_delete_first
    # Delete first element
    result = @ary.delete_first
    assert_equal [2, 3, 4, 5, 6, 7, 8, 9, 10], result
    assert_kind_of Array, result

    result = @ary.delete_first(3)
    assert_equal [4, 5, 6, 7, 8, 9, 10], result
    assert_kind_of Array, result

    result = @ary.delete_first(100)
    assert_equal [], result
    assert_kind_of Array, result
  end

  def test_rstd_array_delete_last
    # Delete last element
    result = @ary.delete_last
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], result
    assert_kind_of Array, result

    result = @ary.delete_last(3)
    assert_equal [1, 2, 3, 4, 5, 6, 7], result
    assert_kind_of Array, result

    result = @ary.delete_last(100)
    assert_equal [], result
    assert_kind_of Array, result
  end

  def test_rstd_array_all?
    # Check all values is same to given argument
    result = @nil_ary.all?(nil)
    assert result
    assert_kind_of TrueClass, result

    result = @dup_ary.all?(1)
    assert result
    assert_kind_of TrueClass, result

    result = @ary.all?(nil)
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_array_all_values_dup?
    # Check all values duplicate?
    result = @ary.all_values_dup?
    assert !result
    assert_kind_of FalseClass, result

    result = @dup_ary.all_values_dup?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_array_all_nil?
    # Check Array values are nil?
    result = @nil_ary.all_nil?
    assert result
    assert_kind_of TrueClass, result

    result = @ary.all_nil?
    assert !result
    assert_kind_of FalseClass, result

    result = @empty_ary.all_nil?
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_array_present?
    # Check Array value is present?
    result = @nil_ary.present?
    assert !result
    assert_kind_of FalseClass, result

    result = @empty_ary.present?
    assert !result
    assert_kind_of FalseClass, result

    result = @ary.present?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_array_blank?
    # Check Array value is blank?
    result = @nil_ary.blank?
    assert result
    assert_kind_of TrueClass, result

    result = @empty_ary.blank?
    assert result
    assert_kind_of TrueClass, result

    result = @ary.blank?
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_array_has?
    # Check Array has argument value?
    result = @ary.has?(true)
    assert !result
    assert_kind_of FalseClass, result

    result = @true_ary.has?(true)
    assert result
    assert_kind_of TrueClass, result

    result = @ary.has?(5)
    assert result
    assert_kind_of TrueClass, result
    
    result = @ary.has?('1')
    assert !result
    assert_kind_of FalseClass, result

    result = @str_ary.has?('1')
    assert result
    assert_kind_of TrueClass, result

    result = @str_ary.has?('5')
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_array_has_bool?
    # Check Array value has bool?
    result = @ary.has_bool?
    assert !result
    assert_kind_of FalseClass, result

    result = @true_ary.has_bool?
    assert result
    assert_kind_of TrueClass, result

    result = @false_ary.has_bool?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_array_has_str?
    # Check Array has String value?
    result = @ary.has_str?
    assert !result
    assert_kind_of FalseClass, result

    result = @str_ary.has_str?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_array_has_num?
    # Check Array has Numeric value?
    result = @nil_ary.has_num?
    assert !result
    assert_kind_of FalseClass, result

    result = @true_ary.has_num?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_array_has_nil?
    # Check Array has nil value?
    result = @nil_ary.has_nil?
    assert result
    assert_kind_of TrueClass, result

    result = @ary.has_nil?
    assert !result
    assert_kind_of FalseClass, result
  end

  using Array.refine_method(:pow){|num = 1|
    self.map{|value|
      value ** num
    }
  }

  def test_rstd_array_refine_method
    # Dynamic refinements
    result = @ary.pow

    assert_equal 10, result.size
    assert_kind_of Array, result
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], result

    result = @ary.pow(2)

    assert_kind_of Array, result
    assert_equal [1, 4, 9, 16, 25, 36, 49, 64, 81, 100], result
  end
end
