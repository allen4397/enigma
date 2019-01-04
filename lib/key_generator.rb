class KeyGenerator
  def self.generate
    array_of_digits = []
    5.times do
      array_of_digits << rand(9)
    end
    array_of_digits.join
  end
end
