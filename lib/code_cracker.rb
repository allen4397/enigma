require_relative 'cypher_master'
require_relative 'decryptor'
require_relative 'key_generator'

class CodeCracker < CypherMaster
  def self.find_key(encryption, date)
    decryption = ""
    while decryption[-4..-1] != " end"
      key = KeyGenerator.generate
      decryption = Decryptor.decrypt(encryption, key, date)
    end
    return key
  end
end
