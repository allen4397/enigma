module ShiftManager
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
