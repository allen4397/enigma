module ShiftManager
  def create_shifts(key, date)
    keys = transform_key(key)
    offsets = transform_date(date)
    calculate_shifts(keys, offsets)
  end

  def calculate_shifts(keys, offsets)
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

  def master_shift(message, shifts)
    shifted_a = shift_a(message.chars, shifts)
    shifted_b = shift_b(shifted_a.chars, shifts)
    shifted_c = shift_c(shifted_b.chars, shifts)
    shift_d(shifted_c.chars, shifts)
  end

  def shift_a(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if ind % 4 == 0
        char = @characters[adjust_index(char, shifts[:A])]
      else
        char
      end
    end.join
  end

  def shift_b(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 1) % 4 == 0
        char = @characters[adjust_index(char, shifts[:B])]
      else
        char
      end
    end.join
  end

  def shift_c(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 2) % 4 == 0
        char = @characters[adjust_index(char, shifts[:C])]
      else
        char
      end
    end.join
  end

  def shift_d(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 3) % 4 == 0
        char = @characters[adjust_index(char, shifts[:D])]
      else
        char
      end
    end.join
  end
end
