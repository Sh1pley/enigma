require_relative 'decryption_rotations'
class Decryption

  attr_reader :key,
              :date

  def initialize(key, date)
    @key = key
    @date = date
    @rotations = DecryptionRotations.new 
  end

  def calculate_rotations
    @rotations.prepare_key_and_offset_for_rotations(key, date)
  end
end