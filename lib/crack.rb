# First creating file requirements and enigma object
# to do our encryption

require_relative 'enigma'

enigma = Enigma.new

# Next taking arguments from the command line and
# setting them as files/variables that can be accessed

ARGV == ["encrypted_file", "cracked_file", "date"]
encrypted_file = File.open(ARGV[0], "r")
cracked_file = File.open(ARGV[1], "w")
date = ARGV[2]

# Pulling out the encryption and cracking it

encryption = encrypted_file.read.chomp
crack = enigma.crack(encryption, date)

# Writing decrypted message in the file

cracked_file.write(crack[:decryption])

# Saving the file name to local variable
# for string concatenation

cracked_file_name = ARGV[1]
key = crack[:key]

puts "Created #{cracked_file_name} with the key #{key} and date #{date}"
