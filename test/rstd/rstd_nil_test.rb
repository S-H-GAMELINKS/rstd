require "test_helper"
require "rstd"

using Rstd::RefineNilClass

class RstdNilTest < Minitest::Test
  def setup
    @nil = nil
  end

  def test_rstd_nil_present?
    # Check nil is present? And, return false.
    result = @nil.present?
    assert !result
    assert_kind_of FalseClass, result

    result = !@nil.present?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_nil_blank?
    # Check nil is blank? And, return true.
    result = @nil.blank?
    assert result
    assert_kind_of TrueClass, result

    result = !@nil.blank?
    assert !result
    assert_kind_of FalseClass, result
  end
end
