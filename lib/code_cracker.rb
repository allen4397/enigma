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
