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

  def test_it_can_perform_a_quick_crack
    code_cracker = CodeCracker.new

    assert_equal "08304", code_cracker.quick_crack("vjqtbeaweqihssi", "291018")
  end

  def test_it_can_perform_a_challenging_crack
    skip
    code_cracker = CodeCracker.new

    assert_equal String, code_cracker.crack_challenge("vjqtbeaweqihssi", KeyGenerator.generate_date)
    assert_equal 5, code_cracker.crack_challenge("vjqtbeaweqihssi", KeyGenerator.generate_date).length
  end

  def test_it_can_build_keys_hash_with_shifts_and_offset
    code_cracker = CodeCracker.new
    shifts = {A: 6, B: 3, C: 10, D: 6}
    offsets = code_cracker.transform_date(KeyGenerator.generate_date)

    expected = {A: 2, B: 2, C: 4, D: 5}

    assert_equal expected, code_cracker.key_builder(shifts, offsets)
  end
end
