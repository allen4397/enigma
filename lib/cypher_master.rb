require_relative 'shift_manager'
require_relative 'shift_creator'

class CypherMaster
  include ShiftManager, ShiftCreator

  attr_reader :characters

  def initialize
    @characters = ("a".."z").to_a << " "
  end
end
