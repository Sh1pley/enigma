require_relative 'encryption_rotations'

class Encryption
  attr_reader :rotations

  def initialize(message)
    @rotations = EncryptionRotations.new.generate_rotations
    @message = message
  end

  def splits_the_message
    split = @message.chars
    prepares_for_encryption(split)
  end

  def prepares_for_encryption(split)
    while split.length != 0
      characters = split.shift(4)
      encryption(characters)
    end
  end

  def encryption(characters)
    

  end
end
