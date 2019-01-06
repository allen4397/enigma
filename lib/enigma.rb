require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'key_generator'

class Enigma
  def encrypt(message, key, date = KeyGenerator.generate_date)
    {
      encryption: Encryptor.encrypt(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(encryption, key, date)
    {
      decryption: Decryptor.decrypt(encryption, key, date),
      key: key,
      date: date
    }
  end
end
