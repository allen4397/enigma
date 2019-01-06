require_relative 'cypher_master'

class Encryptor < CypherMaster
  def self.encrypt(message, key, date)
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts(key, date)
    shifted_a = encryptor.shift_a(message.chars, shifts)
    shifted_b = encryptor.shift_b(shifted_a.chars, shifts)
    shifted_c = encryptor.shift_c(shifted_b.chars, shifts)
    encryptor.shift_d(shifted_c.chars, shifts)
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
