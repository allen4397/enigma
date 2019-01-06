require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    encryptor = Encryptor.new

    assert_instance_of Encryptor, encryptor
  end

  def test_it_can_encrypt_a_message
    actual = Encryptor.encrypt("hello world", "02715", "040895")

    assert_equal "keder ohulw", actual
  end
end
