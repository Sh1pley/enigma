require_relative 'encryption_rotations'
require_relative 'character_map'

class Encryption
  attr_reader :rotations,
              :characters

  def initialize(message)
    @rotations = EncryptionRotations.new.generate_rotations
    @message = message
    @characters = CharacterMap.new.character_hash
  end

  def splits_the_message
    split = @message.chars
    prepares_for_encryption(split)
  end

  def prepares_for_encryption(split)
    encrypted = []
    split.map do |index|
      if index % 4 == 0
        encrypt_index_one(index, encrypted)
      elsif index % 4 == 1
        encrypt_index_two(index, encrypted)
      elsif index % 4 == 2
        encrypt_index_three(index, encrypted)
      elsif index % 4 == 3
        ecrypt_index_four(index, encrypted)
      end
    end

  def encrypt_index_one(index, encrypted)
    value = ((characters.values_at(index).join.to_i) + rotations[0] % 82)
    encrypted << characters.key(value)
  end

  def encrypt_index_two(index, encrypted)
    value = ((characters.values_at(index).join.to_i) + rotations[1] % 82)
    encrypted << characters.key(value)
  end

  def encrypt_index_three(index, encrypted)
    value = ((characters.values_at(index).join.to_i) + rotations[2] % 82)
    encrypted << characters.key(value)
  end

  def encrypt_index_four(index, encrypted)
    value = ((characters.values_at(index).join.to_i) + rotations[3] % 82)
    encrypted << characters.key(value)
  end

end
