require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    encryptor = Encryptor.new

    assert_instance_of Encryptor, encryptor
  end
end
