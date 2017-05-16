###test file###
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translation'
require 'pry'

class BrailleTranslationTest < Minitest::Test

  def test_it_can_split_input_by_each_character
    b = BrailleTranslation.new("abc")
    result = b.split

    assert_equal ["a", "b", "c"], result
  end

  def test_it_can_get_braille_array_for_each_character
    b = BrailleTranslation.new("abc")
    result = b.to_braille

    assert_equal [["0.","..",".."], ["0.","0.",".."], ["00","..",".."]], result
  end

  def test_it_can_output_on_three_lines
    b = BrailleTranslation.new("a")
    result = b.line_up

    assert_equal "0.\n..\n.." , result
  end

  def test_it_can_output_two_braille_characters
    b = BrailleTranslation.new("ab")
    result = b.line_up

    assert_equal "0.0.\n..0.\n...." , result
  end

  def test_it_can_translate_a_long_lower_case_string
    b = BrailleTranslation.new("abcdef")
    result = b.line_up

    assert_equal "0.0.00000.00\n..0....0.00.\n............" , result
  end

  def test_it_can_translate_one_capital_letter
    b = BrailleTranslation.new("A")
    result = b.line_up

    assert_equal "..0.\n....\n.0..", result
  end

  def test_if_can_translate_two_capital_letters
    b = BrailleTranslation.new("AB")
    result = b.line_up

    assert_equal "..0...0.\n......0.\n.0...0..", result
  end

  def test_it_can_translate_mixed_upper_and_lower_case
    b = BrailleTranslation.new("AbCdEf")
    result = b.line_up

    assert_equal "..0.0...0000..0.00\n....0......0...00.\n.0.....0.....0....", result
  end

  def test_if_it_can_output_80_characters_wide
    b = BrailleTranslation.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    result = b.line_up

    assert_equal "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................",
                  result
  end
end
