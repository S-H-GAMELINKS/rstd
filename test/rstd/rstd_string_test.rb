require "test_helper"
require "rstd"

using Rstd::RefineString

class RstdStringTest < Minitest::Test
  def setup
    @string = "Hello World!"
    @lines = "Hello\nWorld!\nHello\nRuby\n"
    @number_str = "Hello0World!"
    @empty_str = ""
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

  def test_rstd_first_line
    # Get first line of String
    result = @lines.first_line
    assert_equal "Hello\n", result
    assert_kind_of String, result
  end

  def test_rstd_last_line
    # Get last line of String
    result = @lines.last_line
    assert_equal "Ruby\n", result
    assert_kind_of String, result
  end

  def test_rstd_has_num?
    # Check number is include string
    result = @number_str.has_num?
    assert result
    assert_kind_of TrueClass, result

    result = @string.has_num?
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_delete_first_line
    # Delete first line of string
    result = @lines.delete_first_line
    assert_equal "World!\nHello\nRuby\n", result
    assert_kind_of String, result
  end

  def test_delete_last_line
    # Delete last line of string
    result = @lines.delete_last_line
    assert_equal "Hello\nWorld!\nHello\n", result
    assert_kind_of String, result
  end

  def test_rstd_string_present?
    # Check String value is present?
    result = @empty_str.present?
    assert !result
    assert_kind_of FalseClass, result

    result = @lines.present?
    assert result
    assert_kind_of TrueClass, result

    result = @string.present?
    assert result
    assert_kind_of TrueClass, result
  end

  def test_rstd_string_blank?
    # Check String value is blank?
    result = @empty_str.blank?
    assert result
    assert_kind_of TrueClass, result

    result = @lines.blank?
    assert !result
    assert_kind_of FalseClass, result

    result = @string.blank?
    assert !result
    assert_kind_of FalseClass, result
  end

  def test_rstd_string_ords
    # Return each char ord
    result = @string.ords
    index = 0

    @string.each_char do |char|
      assert_equal char.ord, result[index]
      index += 1
    end
  end

  def test_rstd_string_char_count
    # Count character count from String
    result = @string.char_count
    assert_equal @string.each_char.map.size, result
    assert_kind_of Integer, result
  end
end
