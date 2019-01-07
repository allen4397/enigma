require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cypher_master'

class CypherMasterTest < Minitest::Test
  def test_it_exists
    cypher_master = CypherMaster.new

    assert_instance_of CypherMaster, cypher_master
  end

  def test_it_starts_with_array_of_characters_of_alphabet
    cypher_master = CypherMaster.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, cypher_master.characters
  end

  def test_it_can_transform_a_key_into_a_hash_of_lettered_keys
    cypher_master = CypherMaster.new

    expected = {
      A: 02,
      B: 27,
      C: 71,
      D: 15
    }

    assert_equal expected, cypher_master.transform_key("02715")
  end

  def test_it_can_transform_a_date_into_a_hash_of_lettered_offsets
    cypher_master = CypherMaster.new

    expected = {
      A: 1,
      B: 0,
      C: 2,
      D: 5
    }

    assert_equal expected, cypher_master.transform_date("040895")
  end

  def test_it_can_extract_offsets_from_date
    cypher_master = CypherMaster.new

    assert_equal "1025", cypher_master.extract_offsets("040895")
  end

  def test_it_can_synthesize_final_shifts_from_keys_and_offsets
    cypher_master = CypherMaster.new

    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }

    assert_equal expected, cypher_master.create_shifts("02715", "040895")
  end

  def test_it_can_adjust_index_to_fit_parameters
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts("02715", "040895")

    assert_equal 2, encryptor.adjust_index(" ", shifts[:A])
  end

  def test_it_can_shift_a_characters
    cypher_master = CypherMaster.new
    shifts = cypher_master.create_shifts("02715", "040895")
    message = "hello world"

    assert_equal "kellr would", cypher_master.shift_a(message.chars, shifts)
  end

  def test_it_can_shift_b_characters
    cypher_master = CypherMaster.new
    shifts = cypher_master.create_shifts("02715", "040895")
    # resetting the B shift to ensure proper testing
    shifts[:B] = 28
    message = "kellr would"

    assert_equal "kfllrawoumd", cypher_master.shift_b(message.chars, shifts)
  end

  def test_it_can_shift_c_characters
    cypher_master = CypherMaster.new
    shifts = cypher_master.create_shifts("02715", "040895")
    message = "kellr would"

    assert_equal "kedlr ooulw", cypher_master.shift_c(message.chars, shifts)
  end

  def test_it_can_shift_d_characters
    cypher_master = CypherMaster.new
    shifts = cypher_master.create_shifts("02715", "040895")
    message = "kedlr ooulw"

    assert_equal "keder ohulw", cypher_master.shift_d(message.chars, shifts)
  end

  def test_it_can_perform_master_shift
    cypher_master = CypherMaster.new
    shifts = cypher_master.create_shifts("02715", "040895")
    message = "hello world"

    assert_equal "keder ohulw", cypher_master.master_shift(message, shifts)
  end
end
