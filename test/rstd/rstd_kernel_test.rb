require "test_helper"
require "rstd"

using Rstd::RefineKernel

class RstdKernelTest < Minitest::Test
  using refine_method(Object, :halo, ->(args) { return args.first})

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
  end
end
