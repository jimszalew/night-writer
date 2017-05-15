require_relative 'dictionary.rb'
require 'pry'
class BrailleTranslation

  # attr_reader :input

  def initialize#(input)
    @line1 = ""
    @line2 = ""
    @line3 = ""
    @translation = ""
    # @input = input
  end

  def to_braille(input)
    braille_chars = input.split(//).map do |letter|
      # binding.pry
      alphabet[letter]
    end

    braille_chars.map do |character|
      @line1 += character[0]
      @line2 += character[1]
      @line3 += character[2]
      @translation = @line1 + "\n" + @line2 + "\n" + @line3
      # binding.pry
    end
    @translation
  end
end
