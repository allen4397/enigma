require_relative 'shift_manager'
require_relative 'shift_creator'

class CypherMaster
  include ShiftManager, ShiftCreator

  attr_reader :characters

  def initialize
    @characters = ("a".."z").to_a << " "
  end

  def adjust_index(char, shift)
    cypher_index = @characters.find_index(char)
    index = cypher_index + shift
    while index > 26
      index -= 27
    end
    index
  end
end
