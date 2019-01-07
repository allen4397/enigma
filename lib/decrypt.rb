# First creating file requirements and enigma object
# to do our encryption

require_relative 'enigma'

enigma = Enigma.new

# Next taking arguments from the command line and
# setting them as files/variables that can be accessed

ARGV == ["encrypted_file", "decrypted_file", "key", "date"]
encrypted_file = File.open(ARGV[0], "r")
decrypted_file = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]

# Pulling out the encryption and decrypting it

encryption = encrypted_file.read.chomp
decryption = enigma.decrypt(encryption, key, date)

# Writing decrypted message in the file

decrypted_file.write(decryption[:decryption])

# Saving the file name to local variable
# for string concatenation

decrypted_file_name = ARGV[1]

p "Created #{decrypted_file_name} with the key #{key} and date #{date}"
