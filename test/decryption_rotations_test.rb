require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption_rotations'

class EncryptionRotationTest < Minitest::Test
  def test_it_exists
    assert DecryptionRotations.new
  end

  def test_it_has_access_to_offset
    dr = DecryptionRotations.new
    assert dr.generate_rotations("12345".chars, "1234")
  end

  def test_it_has_access_to_key
    dr = DecryptionRotations.new
    assert_equal nil, dr.key
  end

  def test_key_starts_with_nil
    dr = DecryptionRotations.new
    assert dr.key.nil?
  end

  def test_offset_has_actual_value
    dr = DecryptionRotations.new
    assert dr.square_the_date
  end

  def test_rotations_has_4_rotations
    dr = DecryptionRotations.new
  
    assert 4, dr.generate_rotations(["1", "2", "3", "4", "5"], ["1", "2", "3", "4"]).length
  end
end