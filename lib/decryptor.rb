require_relative 'cypher_master'

class Decryptor < CypherMaster
  def self.decrypt(encryption, key, date)
    decryptor = Decryptor.new
    shifts = decryptor.create_shifts(key, date)
    decryptor.master_shift(encryption, shifts)
  end

  def adjust_index(char, shift)
    cypher_index = @characters.find_index(char)
    index = cypher_index - shift
    while index < 0
      index += 27
    end
    index
  end
end
