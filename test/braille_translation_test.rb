require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translation'
require 'pry'

class BrailleTranslationTest < Minitest::Test

  def test_it_can_translate_a_to_braille
    skip
    b = BrailleTranslation.new
    input = "a"
    result = b.to_braille(input)

    assert_equal ["0.","..",".."], result
  end

  def test_it_can_output_on_three_lines
    b = BrailleTranslation.new
    input = "a"
    result = b.to_braille(input)

    assert_equal "0.\n..\n.." , result
  end

  def test_it_can_output_two_braille_characters
    b = BrailleTranslation.new
    input = "ab"
    result = b.to_braille(input)

    assert_equal "0.0.\n..0.\n...." , result
  end

  def test_it_can_translate_a_long_lower_case_string
    b = BrailleTranslation.new
    input = "abcdef"
    result = b.to_braille(input)

    assert_equal "0.0.00000.00\n..0....0.00.\n............" , result
  end

  def test_it_can_translate_one_capital_letter
    b = BrailleTranslation.new
    input = "A"
    result = b.to_braille(input)

    assert_equal "..0.\n....\n.0..", result
  end

  def test_if_can_translate_two_capital_letters
    b = BrailleTranslation.new
    input = "AB"
    result = b.to_braille(input)

    assert_equal "..0...0.\n......0.\n.0...0..", result
  end

  def test_if_it_can_output_80_characters_wide
    b = BrailleTranslation.new
    input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    result = b.to_braille(input)

    assert_equal "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................",
                  result
  end

end
