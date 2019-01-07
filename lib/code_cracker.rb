require_relative 'cypher_master'
require_relative 'decryptor'
require_relative 'key_generator'

class CodeCracker < CypherMaster
  def self.find_key(encryption, date)
    code_cracker = CodeCracker.new
    if date == KeyGenerator.generate_date
      code_cracker.crack_challenge(encryption, date)
    else
      code_cracker.quick_crack(encryption, date)
    end
  end

  def crack_challenge(encryption, date)
    # get shifts somehow
    offsets = transform_date(date)
    keys = key_builder(shifts, offsets)
    key = keys[:A] + keys[:C] + keys[:D][1]
    return key
  end

  def key_builder(shifts, offsets)
    keys = {}
    keys[:A] = shifts[:A] - offsets[:A]
    keys[:B] = shifts[:B] - offsets[:B]
    keys[:C] = shifts[:C] - offsets[:C]
    keys[:D] = shifts[:D] - offsets[:D]
    return keys
  end

  def quick_crack(encryption, date)
    decryption = ""
    while decryption[-4..-1] != " end"
      key = KeyGenerator.generate
      decryption = Decryptor.decrypt(encryption, key, date)
    end
    return key
  end
end
