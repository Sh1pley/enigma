require 'pry'
require_relative 'decryption_rotations'
require_relative 'character_map'

class Decryption

  attr_reader :key,
              :date,
              :decrypted,
              :characters,
              :message

  def initialize(key, date, message = "")
    @key = key
    @date = date
    @message = message.split(//)
    @rotations = DecryptionRotations.new
    @characters = CharacterMap.new.character_hash
  end

  def calculate_rotations
    @rotations.prepare_key_and_offset_for_rotations(key, date)
  end

  def decrypt_message(message)
    @decrypted = []
      message.each_with_index do |letter, index|
      # binding.pry
        if index % 4 == 0
          decrypt_index_one(letter, decrypted)
        elsif index % 4 == 1
          decrypt_index_two(letter, decrypted)
        elsif index % 4 == 2
          decrypt_index_three(letter, decrypted)
        elsif index % 4 == 3
          decrypt_index_four(letter, decrypted)
        end
      end
      @decrypted.join
    end

  def decrypt_index_one(letter, decrypted)
     value = ((characters.values_at(letter)[0].to_i) - calculate_rotations[0])
     value += 82 if value < 0
     decrypted << characters.key(value)
   end

   def decrypt_index_two(letter, decrypted)
     value = ((characters.values_at(letter)[1].to_i) + calculate_rotations[1])
     value += 82 if value < 0
     decrypted << characters.key(value)
   end

   def decrypt_index_three(letter, decrypted)
     value = ((characters.values_at(letter)[2].to_i) - calculate_rotations[2])
     value += 82 if value < 0
     decrypted << characters.key(value)
   end

   def decrypt_index_four(letter, decrypted)
     value = ((characters.values_at(letter)[3].to_i) - calculate_rotations[3])
     value += 82 if value < 0
     decrypted << characters.key(value)
   end
  #  binding.pry

end

# test = Decryption.new("80424", "261016")
# test.decrypt_message("TfVE fVEafVEsf".split(//))