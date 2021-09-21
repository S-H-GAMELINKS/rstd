require "test_helper"
require "rstd"

using Rstd::RefineHash

class RstdHashTest < Minitest::Test
  def setup
    @hash = {:key => 42}
  end

  def test_rstd_hash_has_pair?
    # Check has key and value pair?
    result = @hash.has_pair?(:key, 42)

    assert result
    assert_kind_of TrueClass, result

    result = @hash.has_pair?(:key, :value)
    
    assert !result
    assert_kind_of FalseClass, result

    result = @hash.has_pair?(42, 42)
    
    assert !result
    assert_kind_of FalseClass, result
  end
end
