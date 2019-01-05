class Encryptor
  def self.encrypt(message, key, date)
    # CEO method
    hash_of_keys = transform_key(key)
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

  def transform_date(date)
    last_four_digits = extract_offsets(date)
    {
      A: last_four_digits[0],
      B: last_four_digits[1],
      C: last_four_digits[2],
      D: last_four_digits[3]
    }
  end

  def extract_offsets(date)
    squared_form = date.to_i ** 2
    all_digits_backwards = squared_form.digits
    extracted_digits_backwards = all_digits_backwards.first(4)
    extracted_digits = extracted_digits_backwards.reverse
    extracted_digits.join
  end
end
