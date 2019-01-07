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

    expected = enigma.encrypt("hello world", "02715", KeyGenerator.generate_date)

    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_just_a_key
    enigma = Enigma.new
    encryption = enigma.encrypt("hello world", "02715", KeyGenerator.generate_date)

    expected = enigma.decrypt(encryption[:encryption], "02715", KeyGenerator.generate_date)

    assert_equal expected, enigma.decrypt(encryption[:encryption], "02715")
  end

  def test_it_can_encrypt_a_message_with_no_key_or_date
    enigma = Enigma.new

    expected = KeyGenerator.generate_date

    assert_instance_of Hash, enigma.encrypt("hello world")
    assert_equal 11, enigma.encrypt("hello world")[:encryption].length
    assert_equal 5, enigma.encrypt("hello world")[:key].length
    assert_equal expected, enigma.encrypt("hello world")[:date]
  end

  def test_it_can_crack_an_encryption_with_a_date
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      date: "040895",
      key: "02715"
    }

    assert_equal expected, enigma.crack("keder ohulw", "040895")
  end
end
