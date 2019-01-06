require_relative 'encryptor'

class Enigma
  def encrypt(message, key, date)
    {
      encryption: Encryptor.encrypt(message, key, date),
      key: key,
      date: date
    }
  end
end
