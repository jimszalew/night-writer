require_relative 'dictionary.rb'
require 'pry'
class BrailleTranslation

  def initialize
    @line1 = ""
    @line2 = ""
    @line3 = ""
    @translation
  end

  def to_braille(input)
    braille_chars = input.split(//).map do |letter|
      alphabet[letter]
    end

    braille_chars.map do |character|
      @line1 += character[0]
      @line2 += character[1]
      @line3 += character[2]
      @translation = @line1 + "\n" + @line2 + "\n" + @line3
    end
    @translation
  end
end
