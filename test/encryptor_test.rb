require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    encryptor = Encryptor.new

    assert_instance_of Encryptor, encryptor
  end

  def test_it_can_transform_a_key_into_a_hash_of_lettered_keys
    encryptor = Encryptor.new

    expected = {
      A: "02",
      B: "27",
      C: "71",
      D: "15"
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

  def test_it_can_encrypt_a_message
    skip
    actual = Encryptor.encrypt("hello world", "02715", "040895")

    assert_equal "keder ohulw", actual
  end
end
