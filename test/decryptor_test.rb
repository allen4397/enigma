require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  def test_it_exists
    decryptor = Decryptor.new

    assert_instance_of Decryptor, decryptor
  end

  def test_it_can_decrypt_a_message
    actual = Decryptor.decrypt("keder ohulw", "02715", "040895")

    assert_equal "hello world", actual
  end
end
