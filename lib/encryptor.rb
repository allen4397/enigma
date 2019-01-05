class Encryptor
  def self.encrypt(message, key, date)
    # CEO method
    # final shift ABCD operates on message
    # returns encrypted message
  end

  def create_shifts(key, date)
    keys = transform_key(key)
    offsets = transform_date(date)
    {
      A: keys[:A] + offsets[:A],
      B: keys[:B] + offsets[:B],
      C: keys[:C] + offsets[:C],
      D: keys[:D] + offsets[:D]
    }
  end

  def transform_key(key)
    {
      A: key[0..1].to_i,
      B: key[1..2].to_i,
      C: key[2..3].to_i,
      D: key[3..4].to_i
    }
  end

  def transform_date(date)
    last_four_digits = extract_offsets(date)
    {
      A: last_four_digits[0].to_i,
      B: last_four_digits[1].to_i,
      C: last_four_digits[2].to_i,
      D: last_four_digits[3].to_i
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
