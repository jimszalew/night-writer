require_relative 'dictionary.rb'
require 'pry'

class BrailleTranslation

  attr_reader :input

  def initialize(input)
    @line1 = ""
    @line2 = ""
    @line3 = ""
    @translation = ""
    @input = input
  end

  def split
    @input.split(//)
  end

  def to_braille(input)
    output = input.split.map do |character|
      alphabet[character]
    end

    split.map do |character|
      alphabet[character]
    end
  end

  def set_line_width
    original_string = @translation
    answer = @translation.chars.map.each_with_index do |letter, index|
      if index % 80 == 0 && index != 0
        @translation.insert(index, "\n")
      else
        letter
      end
    end
    answer.first
  end

  translation = {}
  translation[line1] = @line1

  def line_up(hash_obj)
    line1 = hash_obj[line1]
    to_braille.map do |character|
      @line1 += character[0]
      @line2 += character[1]
      @line3 += character[2]
      @translation = @line1 + @line2 + @line3
    end
    @translation
  end









end
