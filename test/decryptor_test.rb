require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  def test_it_exists
    decryptor = Decryptor.new

    assert_instance_of Decryptor, decryptor
  end

  def test_it_can_adjust_index_to_fit_parameters
    decryptor = Decryptor.new

    assert_equal 7, decryptor.adjust_index("k", 3)
    assert_equal 25, decryptor.adjust_index(" ", 28)
    assert_equal 11, decryptor.adjust_index("d", 73)
  end

  def test_it_can_decrypt_a_message
    actual = Decryptor.decrypt("keder ohulw", "02715", "040895")

    assert_equal "hello world", actual
  end
end
