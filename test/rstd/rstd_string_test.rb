require "test_helper"
require "rstd"

using Rstd::RefineString

class RstdStringTest < Minitest::Test
  def setup
    @string = "Hello World!"
  end

  def test_rstd_string_first
    # Get the string slice(begin to string head)
    result = @string.first
    assert_equal "H", result
    assert_kind_of String, result
    
    result = @string.first(3)
    assert_equal "Hel", result
    assert_kind_of String, result

    result = @string.first(100)
    assert_equal "Hello World!", result
    assert_kind_of String, result

    result = @string.first(-1)
    assert_equal "Hello World!", result
    assert_kind_of String, result

    result = @string.first(-100)
    assert_equal "", result
    assert_kind_of String, result
  end
end
