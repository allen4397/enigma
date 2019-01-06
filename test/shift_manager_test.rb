require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift_manager'

class ShiftManagerTest < Minitest::Test
  def test_it_exists
    shift_manager = ShiftManager.new

    assert_instance_of ShiftManager, shift_manager
  end
end
