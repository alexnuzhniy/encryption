require "digest"

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Asking for the input
print "Enter the word or phrase to be encrypted: "
user_input = STDIN.gets.encode("UTF-8").chomp
# Validate input
until user_input != "" do
  print "Please provide the word or phrase to be encypted: "
  user_input = STDIN.gets.encode("UTF-8").chomp
end

# Asking for the encryption type
puts "\nChoose the way of encryption:"
puts "1. MD5"
puts "2. SHA1"
way_of_encryption = STDIN.gets.to_i

# Validating choice
until way_of_encryption.between?(1,2) do
  print "Choose correct option: "
  way_of_encryption = STDIN.gets.to_i
end

# Encryption itself
encrypted_input = case way_of_encryption
                    when 1 then Digest::MD5.hexdigest(user_input)
                    when 2 then Digest::SHA1.hexdigest(user_input)
                  end

puts "\nResult: #{encrypted_input}"
