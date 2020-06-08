require "test_helper"
require "rstd"

using Rstd::RefineObject

class RstdObjectTest < Minitest::Test
  def setup
    @obj = Object.new
  end

  def test_rstd_object_present?
    # Check object is present?
    result = @obj.present?
    assert result
    assert_kind_of TrueClass, result
  end
end
