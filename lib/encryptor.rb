require_relative 'shift_manager'

class Encryptor
  include ShiftManager

  attr_reader :characters

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def self.encrypt(message, key, date)
    encryptor = Encryptor.new
    shifts = encryptor.create_shifts(key, date)
    shifted_a = encryptor.shift_a(message.chars, shifts)
    shifted_b = encryptor.shift_b(shifted_a.chars, shifts)
    shifted_c = encryptor.shift_c(shifted_b.chars, shifts)
    encryptor.shift_d(shifted_c.chars, shifts)
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
end
