require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    decryptor = Decryptor.new

    assert_instance_of Decryptor, decryptor
  end
end
