require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_cracker'

class CodeCrackerTest < Minitest::Test
  def test_it_exists
    code_cracker = CodeCracker.new

    assert_instance_of CodeCracker, code_cracker
  end
end
