require 'pry'
require_relative 'decryption_rotations'
require_relative 'character_map'

class Decryption

  attr_reader :key,
              :date,
              :decrypted,
              :characters,
              :message,
              :calculated_rotations

  def initialize(key, date)
    @key = key
    @date = date
    # @message = message.split(//)
    @rotations = DecryptionRotations.new
    @characters = CharacterMap.new.character_hash
  end

  def calculate_rotations
      @calculated_rotations = []
      @calculated_rotations = @rotations.prepare_key_and_offset_for_rotations(key, date)
  end

  def prepare_the_message_for_decryption(message)
    prepared = message.chars
    decrypt_message(prepared)
  end

  def decrypt_message(prepared)
    calculate_rotations
    @decrypted = []
      prepared.each_with_index do |letter, index|
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
     value = ((characters.values_at(letter)[0]) - calculated_rotations[0])
     value += 83 if value < 1
     decrypted << characters.key(value)
   end

   def decrypt_index_two(letter, decrypted)
     value = ((characters.values_at(letter)[0]) - calculated_rotations[1])
     value += 83 if value < 1
     decrypted << characters.key(value)
   end

   def decrypt_index_three(letter, decrypted)
     value = ((characters.values_at(letter)[0]) - calculated_rotations[2])
     value += 83 if value < 1
     decrypted << characters.key(value)
   end

   def decrypt_index_four(letter, decrypted)
     value = ((characters.values_at(letter)[0]) - calculated_rotations[3])
     value += 83 if value < 1
     decrypted << characters.key(value)
   end
 end
