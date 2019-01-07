require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_cracker'

class CodeCrackerTest < Minitest::Test
  def test_it_exists
    code_cracker = CodeCracker.new

    assert_instance_of CodeCracker, code_cracker
  end

  def test_it_can_find_key_with_date_and_encryption
    actual = CodeCracker.find_key("vjqtbeaweqihssi", "291018")

    assert_equal "08304", actual
  end
end
