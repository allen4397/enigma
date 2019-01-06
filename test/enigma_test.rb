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

  def test_it_can_decrypt_a_message
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    actual = enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, actual
  end

  def test_it_can_encrypt_a_message_with_just_a_key
    enigma = Enigma.new

    expected = {
      :encryption=>"mfhatasdwm ",
      :key=>"02715",
      :date=>"010619"
    }

    assert_equal expected, enigma.encrypt("hello world", "02715")
  end
end
