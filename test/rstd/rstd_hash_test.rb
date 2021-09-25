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

  using Hash.refine_method(:all_key){ return self.keys }

  def test_rstd_hash_refine_method
    # Dynamic refinements
    result = @hash.all_key

    assert_equal [:key], result
    assert_kind_of Array, result

    result = {}.all_key

    assert_equal 0, result.size
    assert_equal [], result
    assert_kind_of Array, result
  end
end
