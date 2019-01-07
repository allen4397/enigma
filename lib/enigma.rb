require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'key_generator'

class Enigma
  def encrypt(message, key = KeyGenerator.generate, date = KeyGenerator.generate_date)
    {
      encryption: Encryptor.encrypt(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(encryption, key, date = KeyGenerator.generate_date)
    {
      decryption: Decryptor.decrypt(encryption, key, date),
      key: key,
      date: date
    }
  end

  def crack(encryption, date)
  end
end
