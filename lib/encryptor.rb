class Encryptor
  def self.encrypt(message, key, date)
    # CEO method
    # key turns into ABCD keys
    # date turns into ABCD offsets
    # shift_synthesis turns keys and offsets into final shift
    # final shift ABCD operates on message
    # returns encrypted message
  end

  def transform_key(key)
    {
      A: key[0..1],
      B: key[1..2],
      C: key[2..3],
      D: key[3..4]
    }
  end
end
