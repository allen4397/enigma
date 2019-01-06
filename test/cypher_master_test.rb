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
end
