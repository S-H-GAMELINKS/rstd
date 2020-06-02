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

  def test_rstd_string_last
    # Get the string slice(begin to string end)
    result = @string.last
    assert_equal "!", result
    assert_kind_of String, result
    
    result = @string.last(3)
    assert_equal "ld!", result
    assert_kind_of String, result

    result = @string.last(100)
    assert_equal "Hello World!", result
    assert_kind_of String, result

    result = @string.last(-1)
    assert_equal "H", result
    assert_kind_of String, result

    result = @string.last(-100)
    assert_equal "", result
    assert_kind_of String, result
  end

  def test_rstd_string_has?
    # Check include pattern more short than String#include?
    result = @string.has?("Hell")
    assert result
    assert_kind_of TrueClass, result

    result = @string.has?("Wrong")
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_string_join
    # Add srting to end
    result = @string.join("Foo")
    assert_equal "Hello World!Foo", result
    assert_kind_of String, result

    result = @string.join("Bar")
    assert_equal "Hello World!Bar", result
    assert_kind_of String, result
  end
end
