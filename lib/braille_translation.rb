require_relative 'dictionary.rb'
require 'pry'

class BrailleTranslation

  def initialize
    @line1 = []
    @line2 = []
    @line3 = []
  end

  def split(input)
    input.split(//)
  end

  def to_braille(input)
    input.map do |character|
      alphabet[character]
    end
  end
# #
#   def set_line_width
#     original_string = @translation
#     answer = @translation.chars.map.each_with_index do |letter, index|
#       if index % 80 == 0 && index != 0
#         @translation.insert(index, "\n")
#       else
#         letter
#       end
#     end
#     answer.first
#   end
  #
  # def to_string(input)
  #  input.join("\n")
  # end

  def line_up(input)
    holder = []
# binding.pry
    input.each do |var|
      @line1 << var[0]
      @line2 << var[1]
      @line3 << var[2]
    end
    holder << @line1
    holder << @line2
    holder << @line3
    holder
  end
end
