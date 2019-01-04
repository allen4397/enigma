require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end
end
