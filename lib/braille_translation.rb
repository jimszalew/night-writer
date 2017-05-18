require_relative 'dictionary.rb'
require 'pry'

class BrailleTranslation

  # def initialize
  #
  # end

  def split(input)
    input.split(//)
  end

  def to_braille(input)
    input.map do |character|
      alphabet[character]
    end
  end

  def line1(input)
    output = []
    input.map do |character|
      output << character[0]
    end
    output
  end

  def line2(input)
    output = []
    input.map do |character|
      output << character[1]
    end
    output
  end

  def line3(input)
    output = []
    input.map do |character|
      output << character[2]
    end
    output
  end

  def output(line1, line2, line3)
    output = []
    top = line1
    mid = line2
    low = line3
      until top.length == 0
        output << top.slice!(0..79) + "\n"
        output << mid.shift(80) + "\n"
        output << low.shift(80) + "\n"
      end
    output.join
  end
# binding.pry
end
