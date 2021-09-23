require "test_helper"
require "rstd"

using Rstd::RefineKernel

class RstdKernelTest < Minitest::Test
  using refine_method(Object, :halo, ->(args) { return args})
  using refine_method(Integer, :inc, ->() { self + 1})
  using refine_method(Array, :pow, ->(num = 2){ self.map{|v| v ** num }})

  def test_rstd_kernel_refine_method
    # Dynamic refinements
    obj = Object.new

    result = obj.halo(true)

    assert result
    assert_equal true, result
    assert_kind_of TrueClass, result

    result = obj.halo(false)
    
    assert !result
    assert_equal false, result
    assert_kind_of FalseClass, result

    int = 42

    result = int.inc
    assert_equal 43, result
    assert_kind_of Integer, result

    ary = [1, 2, 3]

    result = ary.pow
    assert_equal [1, 4, 9], result
    assert_kind_of Array, result
    assert_equal 3, result.size

    result = ary.pow(3)
    assert_equal [1, 8, 27], result
    assert_kind_of Array, result
    assert_equal 3, result.size
  end
end
