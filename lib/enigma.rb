require_relative 'encryptor'

class Enigma
  def encrypt(message, key, date)
    {
      message: Encryptor.encrypt(message),
      key: key,
      date: date
    }
  end
end
