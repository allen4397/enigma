# First creating file requirements and enigma object
# to do our encryption

require_relative 'enigma'

enigma = Enigma.new

# Next taking arguments from the command line and
# setting them as files that can be accessed

ARGV == ["message_file", "encrypted_file"]
message_file = File.open(ARGV[0], "r")
encrypted_file = File.open(ARGV[1], "w")

# Pulling out the message and encrypting it

message = message_file.read.chomp
encryption = enigma.encrypt(message)

# Writing encrypted message in the file

encrypted_file.write(encryption[:encryption])

# Saving the file name, key and date to local variable
# for string concatenation

encrypted_file_name = ARGV[1]
key = encryption[:key]
date = encryption[:date]

p "Created #{encrypted_file_name} with the key #{key} and date #{date}"
