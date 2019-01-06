require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cypher_master'

class CypherMasterTest < Minitest::Test
  def test_it_exists
    cypher_master = CypherMaster.new

    assert_instance_of CypherMaster, cypher_master
  end
end
