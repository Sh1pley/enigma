require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption_rotations'

class DecryptionRotationsTest < Minitest::Test

  def test_the_class_exists
    assert DecryptionRotations.new
  end

  def test_it_prepares_key_and_offset_for_rotations
   dr = DecryptionRotations.new
   
   assert Array, dr.prepare_key_and_offset_for_rotations("12345", "1234").class
  end

  def test_rotations_is_an_array
    dr = DecryptionRotations.new
    
    assert_equal Array, dr.generate_rotations("12345", "261016").class
  end

  def test_rotations_has_4_rotations
    dr = DecryptionRotations.new

    assert 4,  dr.generate_rotations(["1", "2", "3", "4", "5"],  ["1", "2", "3", "4"]).length
  end

end