require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    encryptor = Encryptor.new

    assert_instance_of Encryptor, encryptor
  end

  def test_it_starts_with_array_of_characters_of_alphabet
    encryptor = Encryptor.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, encryptor.characters
  end

  def test_it_can_transform_a_key_into_a_hash_of_lettered_keys
    encryptor = Encryptor.new

    expected = {
      A: 02,
      B: 27,
      C: 71,
      D: 15
    }

    assert_equal expected, encryptor.transform_key("02715")
  end

  def test_it_can_transform_a_date_into_a_hash_of_lettered_offsets
    encryptor = Encryptor.new

    expected = {
      A: 1,
      B: 0,
      C: 2,
      D: 5
    }

    assert_equal expected, encryptor.transform_date("040895")
  end

  def test_it_can_extract_offsets_from_date
    encryptor = Encryptor.new

    assert_equal "1025", encryptor.extract_offsets("040895")
  end

  def test_it_can_synthesize_final_shifts_from_keys_and_offsets
    encryptor = Encryptor.new

    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }

    assert_equal expected, encryptor.create_shifts("02715", "040895")
  end

  def test_it_can_adjust_index_to_fit_parameters
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts("02715", "040895")

    assert_equal 2, encryptor.adjust_index(" ", shifts[:A])
  end

  def test_it_can_shift_a_characters
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts("02715", "040895")
    message = "hello world"
    message_characters = message.chars

    assert_equal "kellr would", encryptor.shift_a(message_characters, shifts)
  end

  def test_it_can_shift_b_characters
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts("02715", "040895")
    # resetting the B shift to ensure proper testing
    shifts[:B] = 28
    message = "kellr would"
    message_characters = message.chars

    assert_equal "kfllrawoumd", encryptor.shift_b(message_characters, shifts)
  end

  def test_it_can_encrypt_a_message
    skip
    actual = Encryptor.encrypt("hello world", "02715", "040895")

    assert_equal "keder ohulw", actual
  end
end
