require 'pry'
require_relative "offset"
require_relative "key"

class EncryptionRotations

  attr_reader :offset,
              :key,
              :rotations

  def offset
    @offset = Offset.new.square_the_date
  end

  def key
    @key = Key.new.generate_number
  end

  def generate_rotations
    @rotations = [(offset[0].to_i + key[0..1].join.to_i),
                  (offset[1].to_i + key[1..2].join.to_i),
                  (offset[2].to_i + key[2..3].join.to_i),
                  (offset[3].to_i + key[3..4].join.to_i)]
  end
end
