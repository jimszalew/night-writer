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

  def to_braille
    split.map do |character|
      alphabet[character]
    end
  end

  def line_up
    to_braille.map do |character|
      @line1 += character[0]
      @line2 += character[1]
      @line3 += character[2]
      @translation = @line1 + "\n" + @line2 + "\n" + @line3
    end
   @translation
  end
end
