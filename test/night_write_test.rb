require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write_class'

class NightWriteTest < Minitest::Test

  def test_night_write_class_exists
    n = NightWrite.new('./lib/message.txt', './lib/braille.txt')

    assert_instance_of NightWrite, n
  end

  def test_if_input_file_can_be_read
    n = NightWrite.new('./lib/message.txt', './lib/braille.txt')

    assert_equal "hello world", n.message
  end

  def test_it_can_write_to_new_file
    skip
    n = NightWrite.new('./lib/message.txt', './lib/braille.txt')
    # require "pry"; binding.pry
    assert_equal "hello world", n.write_to_file
  end
  
  def test_it_can_output_three_hello_worlds
    n = NightWrite.new('./lib/message.txt', './lib/braille.txt')

    assert_equal "hello world\n hello world\n hello world", n.write_three
  end


end
