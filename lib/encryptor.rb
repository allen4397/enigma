require_relative 'cypher_master'

class Encryptor < CypherMaster
  def self.encrypt(message, key, date)
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts(key, date)
    encryptor.master_shift(message, shifts)
  end
end
