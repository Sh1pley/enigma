class DecryptionRotations

def prepare_key_and_offset_for_rotations(key, date)
  offset = square_the_date(date)
  key = key.chars
  generate_rotations(key, date)
end


  def square_the_date(date)
    date_squared = (date).to_i ** 2
    generate_offset(date_squared)
  
  end

  def generate_offset(date_squared)
    decryption_offset = []
   (decryption_offset << date_squared.to_s.chars[-4..-1]).flatten
   decryption_offset
  end


def generate_rotations(key, offset)
  

    @rotations = [(offset[0].to_i + key[0..1].join.to_i),
                  (offset[1].to_i + key[1..2].join.to_i),
                  (offset[2].to_i + key[2..3].join.to_i),
                  (offset[3].to_i + key[3..4].join.to_i)]
  end

end