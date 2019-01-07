require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'key_generator'
require_relative 'code_cracker'

class Enigma
  def encrypt(message, key = generate_key, date = generate_date)
    {
      encryption: Encryptor.encrypt(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(encryption, key, date = generate_date)
    {
      decryption: Decryptor.decrypt(encryption, key, date),
      key: key,
      date: date
    }
  end

  def crack(encryption, date = generate_date)
    key = CodeCracker.find_key(encryption, date)
    {
      decryption: Decryptor.decrypt(encryption, key, date),
      date: date,
      key: key
    }
  end

  def generate_key
    KeyGenerator.generate
  end

  def generate_date
    KeyGenerator.generate_date
  end
end
