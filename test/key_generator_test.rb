require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end

  def test_it_can_create_five_random_digits
    actual = KeyGenerator.generate

    assert_instance_of String, actual
    assert_equal 5, actual.length
  end

  def test_it_can_generate_todays_date
    actual = KeyGenerator.generate_date
    mock_1 = mock
    mock_1.stubs(:date).returns(Date.today.strftime("%d%m%y"))

    assert_equal mock_1.date, actual
  end
end
