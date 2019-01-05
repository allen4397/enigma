require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_a_message
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    actual = enigma.encrypt("hello world", "02715", "040895")

    assert_equal expected, actual
  end
end
