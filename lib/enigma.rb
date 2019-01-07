require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'key_generator'
require_relative 'code_cracker'

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
    key = CodeCracker.find_key(encryption, date)
    {
      decryption: Decryptor.decrypt(encryption, key, date),
      date: date,
      key: key
    }
  end
end
