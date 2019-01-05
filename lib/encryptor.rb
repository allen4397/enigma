require 'pry'

class Encryptor
  attr_reader :characters

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def self.encrypt(message, key, date)
    # CEO method
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts(key, date)
    message_characters = message.chars
    shifted_a = encryptor.shift_a()
    # test = message_characters.map.with_index do |char, ind|
    #   cypher_index = characters.find_index(char)
    #   if ind % 4 == 0
    #     new_index = cypher_index + shifts[:A]
    #     while new_index > 26
    #       new_index -= 27
    #     end
    #     char = characters[new_index]
    #   elsif ind - 1 % 4 == 0
    #     new_index = cypher_index + shifts[:B]
    #     while new_index > 26
    #       new_index -= 27
    #     end
    #     char = characters[new_index]
    #   elsif ind - 2 % 4 == 0
    #     new_index = cypher_index + shifts[:C]
    #     while new_index > 26
    #       new_index -= 27
    #     end
    #     char = characters[new_index]
    #   elsif ind - 3 % 4 == 0
    #     new_index = cypher_index + shifts[:D]
    #     while new_index > 26
    #       new_index -= 27
    #     end
    #     char = characters[new_index]
    #   else
    #     char
    #   end
    # end
    # returns encrypted message
  end

  def adjust_index(char, shift)
    cypher_index = @characters.find_index(char)
    index = cypher_index + shift
    while index > 26
      index -= 27
    end
    index
  end

  def shift_a(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if ind % 4 == 0
        new_index = adjust_index(char, shifts[:A])
        char = @characters[new_index]
      else
        char
      end
    end.join
  end

  def shift_b(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 1) % 4 == 0
        new_index = adjust_index(char, shifts[:B])
        char = @characters[new_index]
      else
        char
      end
    end.join
  end

  def shift_c(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 2) % 4 == 0
        new_index = adjust_index(char, shifts[:C])
        char = @characters[new_index]
      else
        char
      end
    end.join
  end

  def shift_d(message_characters, shifts)
    message_characters.map.with_index do |char, ind|
      if (ind - 3) % 4 == 0
        new_index = adjust_index(char, shifts[:D])
        char = @characters[new_index]
      else
        char
      end
    end.join
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
