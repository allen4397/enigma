require_relative 'cypher_master'

class Encryptor < CypherMaster
  def self.encrypt(message, key, date)
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts(key, date)
    encryptor.master_shift(message, shifts)
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
