require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translation'
require 'pry'

class BrailleTranslationTest < Minitest::Test

  def test_it_can_split_input_by_each_character
    input = "abc"
    expected = ["a", "b", "c"]

    b = BrailleTranslation.new
    result = b.split(input)

    assert_equal expected, result
  end

  def test_it_can_get_braille_array_for_each_character
    input = ["a", "b", "c"]
    expected = [["0.","..",".."], ["0.","0.",".."], ["00","..",".."]]

    b = BrailleTranslation.new
    result = b.to_braille(input)

    assert_equal expected, result
  end

  def test_it_can_output_separate_lines_of_braille_characters
    input = [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    expected1 = ["0.", "0.", "00"]
    expected2 = ["..", "0.", ".."]
    expected3 = ["..", "..", ".."]

    b = BrailleTranslation.new
    result1 = b.line1(input)
    result2 = b.line2(input)
    result3 = b.line3(input)

    assert_equal expected1, result1
    assert_equal expected2, result2
    assert_equal expected3, result3
  end

  # def test_it_can_organize_by_line
  #   skip
  #   input = [["0.","..",".."], ["0.","0.",".."], ["00","..",".."]]
  #   expected = [["0.","0.","00"], ["..", "0.", ".."], ["..","..",".."]]
  #
  #   b = BrailleTranslation.new
  #   result = b.line_up(input)
  #
  #   assert_equal expected, result
  # end

  def test_it_can_output_braille_as_string
    skip
    input = [["0.","0.","00"], ["..", "0.", ".."], ["..","..",".."]]
    expected = "0.0.00\n..0...\n......"

    b = BrailleTranslation.new
    result = b.output(input)

    assert_equal expected, result
  end

  # def test_it_can_output_two_braille_characters
  #   skip
  #   input = ["ab"]
  #   expected = [["0.","..",".."],["0.","0.",".."]]
  #
  #   b = BrailleTranslation.new
  #   result = b.to_braille(input)
  #
  #   assert_equal expected, result
  # end

  # def test_it_can_translate_a_long_lower_case_string
  #   skip
  #   b = BrailleTranslation.new("abcdef")
  #   result = b.line_up
  #
  #   assert_equal "0.0.00000.00\n..0....0.00.\n............" , result
  # end

  # def test_it_can_translate_one_capital_letter
  #   skip
  #   b = BrailleTranslation.new("A")
  #   result = b.line_up
  #
  #   assert_equal "..0.\n....\n.0..", result
  # end

  # def test_if_can_translate_two_capital_letters
  #   skip
  #   b = BrailleTranslation.new("AB")
  #   result = b.line_up
  #
  #   assert_equal "..0...0.\n......0.\n.0...0..", result
  # end

  # def test_it_can_translate_mixed_upper_and_lower_case
  #   skip
  #   b = BrailleTranslation.new("AbCdEf")
  #   result = b.line_up
  #
  #   assert_equal "..0.0...0000..0.00\n....0......0...00.\n.0.....0.....0....", result
  # end

  # def test_if_it_can_output_80_characters_wide
  #   skip
  #   b = BrailleTranslation.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #   result = b.line_up
  #
  #   assert_equal "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................",
  #                 result
  # end

  # def test_if_array_of_strings_into_string_with_new_lines_chars
  #   skip
  #   b = BrailleTranslation.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #   input = ["0.0.0.0.", "........", "........","0.0.", "....", "...."]
  #   expected = "0.0.0.0.\n........\n........\n0.0.\n....\n...."
  #
  #   assert_equal expected, b.to_string(input)
  #
  # end

  def test_it_can_break_at_80_characters
    input1 = ["0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0.", "0."]
    input2 = ["..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", ".."]
    input3 = ["..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", "..", ".."]
    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.0.0.0.0.0.0.0.0.0.\n....................\n...................."

    b = BrailleTranslation.new
    result = b.output(input1, input2, input3)

    assert_equal expected, result
  end
end
