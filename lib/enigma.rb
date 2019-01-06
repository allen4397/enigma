require_relative 'encryptor'
require_relative 'decryptor'

class Enigma
  def encrypt(message, key, date)
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
