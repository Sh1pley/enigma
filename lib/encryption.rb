require_relative 'encryption_rotations'
require_relative 'character_map'

class Encryption
  # binding.pry
  attr_reader :rotations,
              :characters,
              :encrypted,
              :offset,
              :key,
              :generated_rotations

  def initialize(message)
    @rotations = EncryptionRotations.new
    @key = rotations.key
    @offset = rotations.offset
    @message = message
    @characters = CharacterMap.new.character_hash
  end

  def generate_rotations
    @generated_rotations = []
  @generated_rotations = rotations.generate_rotations

  end

  def splits_the_message
    split = @message.split(//)
    prepares_for_encryption(split)
  end

  def prepares_for_encryption(split)
    # binding.pry
    generate_rotations
     @encrypted = []
     split.each_with_index do |letter, index|
    #  binding.pry
       if index % 4 == 0
         encrypt_index_one(letter, encrypted)
       elsif index % 4 == 1
         encrypt_index_two(letter, encrypted)
       elsif index % 4 == 2
         encrypt_index_three(letter, encrypted)
       elsif index % 4 == 3
         encrypt_index_four(letter, encrypted)
       end
     end
     @encrypted.join
   end

   def encrypt_index_one(letter, encrypted)
    #  binding.pry
     value = ((characters.values_at(letter).join.to_i) + generated_rotations[0])
     value -= 83 if value > 83
     encrypted << characters.key(value)
   end

   def encrypt_index_two(letter, encrypted)
     value = ((characters.values_at(letter).join.to_i) + generated_rotations[1])
     value -= 83 if value > 83
     encrypted << characters.key(value)
   end

   def encrypt_index_three(letter, encrypted)
     value = ((characters.values_at(letter).join.to_i) + generated_rotations[2])
     value -= 83 if value > 83
     encrypted << characters.key(value)
   end

   def encrypt_index_four(letter, encrypted)
     value = ((characters.values_at(letter).join.to_i) + generated_rotations[3])
     value -= 83 if value > 83
     encrypted << characters.key(value)
   end

end
