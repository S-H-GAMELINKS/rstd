require "test_helper"
require "rstd"

using Rstd::RefineObject

class RstdObjectTest < Minitest::Test
  def setup
    @obj = Object.new
  end

  def test_rstd_object_refine_method?
    # Check given method is refined?
    result = @obj.refine_method?(:present?)
    assert result
    assert_kind_of TrueClass, result

    assert_raises ArgumentError do
      @obj.refine_method?("present?")
    end

    assert_raises NotImplementedError do
      @obj.refine_method?(:halo)
    end

    result = @obj.refine_method?(:send)
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_object_present?
    # Check object is present?
    result = @obj.present?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_object_blank?
    # Check object is blank?
    result = @obj.blank?
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_object_true?
    # Check object is true?
    result = @obj.true?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_object_false?
    # Check object is false?
    result = @obj.false?
    assert !result
    assert_kind_of FalseClass, result
  end
end
